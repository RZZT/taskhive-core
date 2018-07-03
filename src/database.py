from sqlalchemy import Column, Integer, String, create_engine, ForeignKey, Boolean
from sqlalchemy.orm import sessionmaker, scoped_session
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.exc import IntegrityError

Base = declarative_base()
engine = create_engine('sqlite:///taskhive.db')


class ChannelType(Base):
	__tablename__ = 'channeltype'
	id = Column(Integer, primary_key=True)
	name = Column(String)


class Category(Base):
	__tablename__ = 'category'
	id = Column(String, primary_key=True)
	name = Column(String)

class Channel(Base):

	__tablename__ = 'channel'
	channel_ID = Column(Integer, primary_key=True)
	channel_HEX = Column(String, ForeignKey('category.id'))
	name = Column(String)
	encoded_name = Column(String)
	bit_address = Column(String)
	channel_type = Column(Integer, ForeignKey('channeltype.id'))

	def __repr__(self):
		return "<Channel(channel_HEX='{}', name='{}')>".format(self.channel_HEX, self.name)


class Profile(Base):

	__tablename__ = 'profile'
	id = Column(String, primary_key=True)
	handle = Column(String)
	public_key = Column(String)
	address = Column(String)
	address_encoded = Column(String)
	privacy_level = Column(Integer)


class UserCategories(Base):
	__tablename__ = 'usercategories'
	id = Column(Integer, primary_key=True)
	hex_code = Column(String, ForeignKey('category.id'))
	profile = Column(String, ForeignKey('profile.id'))



class Task(Base):
	__tablename__ = 'task'
	id = Column(String, primary_key=True)
	bit_address = Column(String)
	is_active = Column(Boolean)


class Reputation(Base):
	__tablename__ = 'reputation'
	task_id = Column(Integer, ForeignKey('task.id'))
	message = Column(String)
	score = Column(Integer)
	pub_key = Column(Integer)
	signature = Column(String)

Base.metadata.create_all(engine)

class DatabaseConnection(object):

	def __init__(self):
		Session = scoped_session(sessionmaker(bind=engine))

		self.ses = Session()


	def checkTask(self, task_id):
		task = self.ses.query(Task).filter_by(id=task_id).first()
		if task:
			return task
		return False


	def storeTask(self, bitTask):
		task = Task(id=bitTask['task_id'], bit_address=bitTask['bit_address'], is_active=True)
		self.ses.add(task)
		self.ses.commit()

	def getCategories(self):
		cats = []
		count = 0
		firstRun = True

		# for cat in self.ses.query(Category).all():
		# 	hex_codes = [cat.id[i:i+2] for i in range(0, len(cat.id), 2)]
		# 	if firstRun:
		# 		cats.append({
		# 			"hex": cat.id,
		# 			"name": cat.name,
		# 			"sub_categories": []
		# 			})
		# 		firstRun = False
		# 		continue
		# 	if len(hex_codes) > 1:
		# 		cats[count]['sub_categories'].append({
		# 				"hex": cat.id,
		# 				"name": cat.name

		# 			})
		# 	else:
		# 		cats.append({
		# 			"hex": cat.id,
		# 			"name": cat.name,
		# 			"sub_categories": []
		# 			})
		# 		count += 1

		for cat in self.ses.query(Category).all():
			hex_codes = [cat.id[i:i+2] for i in range(0, len(cat.id), 2)]
			print(hex_codes)
			if len(hex_codes) > 1:
				cats.append({
					"hex": cat.id,
					"name": cat.name
				})
		print(cats)
		return {"categories":cats}


	def generateCategories(self):
		with open('categories.txt', 'r') as f:
			for line in f.readlines():
				if line.strip():
					elements = line.split()
					hex_code = elements[0]
					name = ''.join([el + ' ' for el in elements[1:]]).strip()
					new_cat = Category(id=hex_code, name=name)
					self.ses.add(new_cat)
					try:
						self.ses.commit()
					except IntegrityError:
						self.ses.rollback()


	def getChannelTypes(self):
		return self.ses.query(ChannelType).all()


	def getChannels(self):
		return self.ses.query(Channel).all()

	def getChannelByCategory(self, category_hex):
		channels = []
		for category in category_hex:
			cat = [category[i:i+2] for i in range(0, len(category), 2)][0]
			chan = self.ses.query(Channel).filter_by(channel_HEX=cat).first()
			print(cat, category)
			print(chan)
			if chan is not None:
				if chan.channel_HEX in channels:
					continue
				channels.append(chan)
		return channels


	def createChannelTypes(self, types=['Offers', 'Requests']):
		for t in types:
			result = self.ses.query(ChannelType).filter_by(name=t).first()
			if not result:
				typ = ChannelType(name=t)
				self.ses.add(typ)
		self.ses.commit()
		return self.ses.query(ChannelType).all()



	def getProfile(self):
		try:
			profile = self.ses.query(Profile).all()[0]
		except:
			return False
		categoriesInfo = self.ses.query(UserCategories).filter_by(id=profile.id).first()
		return profile



	def createProfile(self, profile_DATA):
		new_prof = Profile(
			id=profile_DATA['private_key'],
			handle=profile_DATA['handle'],
			public_key=profile_DATA['public_key'],
			address=profile_DATA['address'],
			address_encoded=profile_DATA['address_encoded'],
			privacy_level=profile_DATA['privacy_level']
		)
		self.ses.add(new_prof)
		for cat in profile_DATA['categories']:
			cat_ = self.ses.query(Category).filter_by(name=cat['name']).first()
			new_usercat = UserCategories(hex_code=cat_.id, profile=profile_DATA['private_key'])
			self.ses.add(new_usercat)
		self.ses.commit()



	def storeChannels(self, channelInfo):
		for channel in channelInfo:
			try:
				chan = Channel(
					channel_HEX=channel['hex'],
					name=channel['name'],
					encoded_name=channel['encoded_name'],
					channel_type=channel['type'],
					bit_address=channel['bit_address']
				)
				self.ses.add(chan)
				self.ses.commit()
			except IntegrityError:
				self.ses.rollback()



	def storeReputation(self, )


