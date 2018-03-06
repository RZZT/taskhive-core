#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import Qt, QObject, QModelIndex, QUrl, pyqtSignal, QFileInfo, pyqtSlot, pyqtSignal, QFile, QMimeDatabase, QMimeType, QVariant, QThread
from PyQt5.QtQml import qmlRegisterType, QQmlEngine, QQmlComponent, QQmlApplicationEngine
from PyQt5.QtQuick import QQuickView
from api import Taskhive as TaskhiveAPI
from database import DatabaseConnection
import atexit
import time
import json
import datetime

class FileInfo(QObject):
    def __init__(self):
            QObject.__init__(self)
            self._filesize = None

    @pyqtSlot(str, result=int)
    def get_filesize(self, path):
        if path.startswith('file:///'):
            path = path.strip('file:///')
        file = QFileInfo(QFile(path))
        self._filesize = file.size()
        return self._filesize

    @pyqtSlot(str, result=str)
    def get_MIMETYPE(self, path):
        if path.startswith('file:///'):
            path = path.strip('file:///')
        file = QFileInfo(QFile(path))
        db = QMimeDatabase()
        MimeType = db.mimeTypeForFile(file)
        return MimeType.name()

    @pyqtSlot(str, result=str)
    def get_filename(self, path):
        if path.startswith('file:///'):
            path = path.strip('file:///')
        file = QFileInfo(QFile(path))
        return file.fileName()



class TaskThread(QThread):

    newTask = pyqtSignal(QVariant, arguments=['result'])

    def __init__(self):
        QObject.__init__(self)
        self.filters = []
        self._paused = False
        self._localAPI = TaskhiveAPI()

    @pyqtSlot()
    def pause(self):
        self._paused = True

    @pyqtSlot()
    def resume(self):
        self._paused = False

    @pyqtSlot()
    def run(self):
        self._localAPI.create_bitmessage_api()
        while not self._paused:
            result = self._localAPI.getPostings()
            connections, _, _, _ = self._localAPI.client_connections()
            result['connections'] = connections
            self.newTask.emit(result)
            print(connections)
            time.sleep(5)

    def handle_filters(self):
        return None



class TaskSendPost(QThread):

    taskStatus = pyqtSignal(QVariant, arguments=['status'])

    def __init__(self):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()


    @pyqtSlot(QVariant, result=QVariant)
    def run(self, JSON_DATA):
        self._localAPI.create_bitmessage_api()
        task_JSON = JSON_DATA.toVariant()
        deadline = task_JSON['task_deadline'] + ' 23:59:59'
        formatted_d = datetime.datetime.strptime(deadline,'%d/%m/%Y %H:%M:%S')
        epoch_deadline = (formatted_d - datetime.datetime(1970, 1, 1)).total_seconds()
        task_JSON['task_deadline'] = epoch_deadline
        self._localAPI.create_posting(task_JSON)
        self.taskStatus.emit({'status':'sent'})
        # return {'status':'sent'}


class Message(QObject):

    msgThread = pyqtSignal(QVariant, arguments=['msg'])

    def __init__(self):
        QObject.__init__(self)
        self._msgThread = None
        self._sendThread = None
        self._inboxThread = None

    @pyqtSlot(str)
    def getMessageThread(self, task_id, from_add=None):
        if task_id == 'EMPTY':
            task_id = None
        self._msgThread = MessageThread(task_id, from_add)
        self._msgThread.msg.connect(self.msgThread)
        self._msgThread.start()


    @pyqtSlot(QVariant)
    def sendMessage(self, JSON_DATA):
        self._sendThread = SendMessageThread(JSON_DATA)
        self._sendThread.start()


    @pyqtSlot(QVariant)
    def getMessageInbox(self, task_id):
        self._inboxThread = InboxThread(task_id)


class InboxThread(QThread):

    msgInbox = pyqtSignal(QVariant, arguments=['task_id'])

    def __init__(self, task_id):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()
        self,task_id = task_id

    #def run(self):
     #   self._localAPI.create_bitmessage_api()
      #  messages = self._localAPI.

class MessageThread(QThread):

    msg = pyqtSignal(QVariant, arguments=['msg'])

    def __init__(self, task_id, from_add=None):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()
        self.task_id = task_id
        self.from_add = from_add

    @pyqtSlot()
    def run(self):
        self._localAPI.create_bitmessage_api()
        msg_p = self._localAPI.getMessageThread(self.task_id, from_add=self.from_add)
        print(msg_p)
        self.msg.emit(msg_p)



class SendMessageThread(QThread):


    def __init__(self, task_JSON):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()
        self._JSON = task_JSON


    @pyqtSlot()
    def run(self):
        self._localAPI.create_bitmessage_api()
        task_JSON = self._JSON.toVariant()
        self._localAPI.send_privMessage(task_JSON)



class TaskProfile(QThread):

    def __init__(self):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()

    @pyqtSlot(result=QVariant)
    def verifyProfile(self):
        return self._localAPI.verifyProfile()



class CreateProfile(QThread):
    

    def __init__(self):
        QObject.__init__(self)
        self._localAPI = TaskhiveAPI()

    @pyqtSlot(QVariant)
    def create(self, profile_DATA):
        profile_JSON =  profile_DATA.toVariant()
        self._localAPI.createProfile(profile_JSON)


class TaskhiveAddress(QObject):
    def __init__(self):
        QObject.__init__(self)

    @pyqtSlot(result=str)
    def generateAddress(self):
        API.generate_and_store_keys()


class TaskhiveCategories(QObject):
    def __init__(self):
            QObject.__init__(self)
            self.db = DatabaseConnection()

    @pyqtSlot(result=QVariant)
    def getCategories(self):
        categories = self.db.getCategories()
        return categories

class Taskhive(QApplication):
    def __init__(self, argv):
        QApplication.__init__(self, argv)





test_json = '''{
  "task_type":"requests",
  "task_categories":["01"],
  "task_title":"Write a short story for my video",
  "task_body":"I have a cat blog that needs a story written for it. I will pay for a story about cats.",
  "task_keywords":[ "cats", "blog", "writing"],
  "task_references":[ "URL1", "URL2"],
  "task_cost":"0.001",
  "task_currency":"BTC",
  "task_payment_rate_type":"task",
  "task_payment_methods":[ "BTC", "DOGE"],
  "task_deadline":1482710400,
  "task_license":"CC BY 4.0",
  "task_escrow_required":1,
  "task_escrow_recommendation":"BITCOIN-PUBKEY",
  "task_address":"TEMP-BM-ADDRESS",
  "task_owner":"BITCOIN-PUBKEY",
  "task_id":"YsBGsF3dc9But9GN5mXOTwEFIZWZ8=",
  "task_entropy":"LATEST-BLOCKCHAIN-HASH",
  "task_expiration":1482710400
  }'''






if __name__ == "__main__":
    app = Taskhive(sys.argv)
    API = TaskhiveAPI()
    BitMessageAPI = API.run_bitmessage()
    time.sleep(10)
    BitMessage = API.create_bitmessage_api()
    if BitMessage in ['invalid keys_file settings', 'keyfile does not exist']:
        API.create_settings()
        BitMessage = API.create_bitmessage_api()
        BitMessageAPI = API.run_bitmessage()
    API.setup_channels()
    if API.run_bm.poll() is None:
        print(API.find_running_bitmessage_port())
    connections, _, _, _ = API.client_connections()
    print(connections)
    # API.create_posting(test_json)
    # API.generate_and_store_keys()
    engine = QQmlApplicationEngine()
    

    file = FileInfo()
    categories = TaskhiveCategories()
    thread = TaskThread()
    createProfile = CreateProfile()
    task = TaskSendPost()
    message = Message()
    profile = TaskProfile()
    sendMessage = MessageThread('')
    context = engine.rootContext()
    context.setContextProperty('FileInfo', file)
    context.setContextProperty('TaskhiveCategories', categories)
    context.setContextProperty('Message', message)
    context.setContextProperty('MessageThread', sendMessage)
    context.setContextProperty('TaskThread', thread)
    context.setContextProperty('Task', task)
    context.setContextProperty('CreateProfile', createProfile)
    context.setContextProperty('Profile', profile)
    engine.load(QUrl('UI/main.qml'))
    atexit.register(API.shutdown_bitmessage)
    sys.exit(app.exec_())

