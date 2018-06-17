import QtQuick 2.5
import QtQuick.Window 2.1
import QtQuick.Controls 2.3
import "Components/"
Window {
    id: window
    height: 1000
    width: 900
    color: "#0c0c0c"
    title: "Contract Window"
    FontLoader { id: localFont; source: "fonts/Source_Sans_Pro/SourceSansPro-Regular.ttf" }
    property ListModel vendorModel: ListModel {}
    property ListModel vendeeModel: ListModel {}
    property string abcd: "abcdefghijklmnopqrstv"
    Text {
        id: windowTitle
        text: qsTr("HiveProtected Contract Template")
        anchors.horizontalCenter: parent.horizontalCenter
        font { family: localFont.name; pixelSize: 16; bold: true }
        color: "#FFFFFF"
        anchors.top: parent.top
        anchors.topMargin: 20
    }
    Flickable {
        id: contractContent
        anchors.rightMargin: 30
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.VerticalFlick
        anchors.top: windowTitle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.right: parent.right
        anchors.bottom: buttons.top
        clip: true
        ScrollBar.vertical: ScrollBar { id: vbar; active: true }
        contentWidth: contractContent.width
        contentHeight: contractLayout.height
        Column {
            id: contractLayout
            anchors.rightMargin: 10
            spacing: 10
            anchors.left: parent.left
            anchors.right: parent.right
            Text {
                text: qsTr("Parties")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                text: qsTr("(1) This agreement is between:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                spacing: 5
                Text {
                    text: qsTr("(a)")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                LineEdit {
                    text: qsTr("Vendor's public key")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr(", address")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
                LineEdit {
                    text: qsTr("Vendor's address")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("(hereafter 'the Vendor');and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                    anchors.top: parent.top
                    anchors.topMargin: 5
                }
            }
            Row {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                spacing: 5
                Text {
                    text: qsTr("(b)")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Vendee's public key")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr(", address")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Vendee's address")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("(hereafter 'the Vendee');and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                text: qsTr("Intepretation")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                text: qsTr("(2) In this agreement:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(a) 'the Arbitrator' means the person identified in Clause (5); and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(b) 'the Claimant' means, in respect of arbitral proceedings, the party issuing a statement of claim; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(c) 'contract price' means the total sum payable by the Vendee to the Vendor on ordinary performance of this agreement; and")
                anchors.right: parent.right
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(d) 'contract term' means the number of days between and including the date of execution and the date of completion; and")
                anchors.right: parent.right
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(e) date of completion' means the date on which the obligations under this agreement are to have been performed; and")
                anchors.right: parent.right
                anchors.rightMargin: 0
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60

                text: qsTr("(f) 'date of execution' means the date on which the obligations under this agreement are to have been performed; and")
                anchors.right: parent.right
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(g) 'the Respondent' means, in respect of arbitral proceedings, the party against whom a claim is made; and")
                anchors.right: parent.right
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                text: qsTr("(h) 'the Vendee' means the party identified in Clause (1)(b); and")
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(i) 'the Vendor' means the party identified in Clause (1)(a).")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(3) This agreement shall be interpreted such that:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(a) words and phrases shall be construed according to their ordinary grammatical meaning unless:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) they have been explicitly defined in Clause (2); or")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) their context indicates they should be construed otherwise; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(b) the meaning of a provision or a set of provisions shall be interpreted by reference to:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) the intent of the parties where evidenced; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) the interpretation a reasonable person would make; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(iii) all relevant circumstances, including the nature and purpose of the agreement; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(c) a provision is void if it purports to:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) restrict one party's right to seek recourse by means of arbitration; or")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) modify or negate another provision of this agreement.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                text: qsTr("Dispute Resolution")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(4) Any dispute, controversy or claim arising out of or relating to this contract, or the breach, termination or invalidity thereof, shall be settled by arbitration.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Flow {
                id: flow1
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(5) The Arbitrator shall be")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Arbitrator's public key")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr(", address")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Arbitrator's address")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("(hereafter 'the Arbitrator');and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Flow {
                id: flow2
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(6) For each and every dispute referred to arbitrator, each party shall pay")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Amount")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("into escrow upon filing either a statement of claim or statement of defence.")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(7) The Arbitrator's fees shall be half the combined amount paid into escrow by the parties in accordance with Clause (6), regardless of whether both parties have paid.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(8) The Arbitrator may apportion liability for their fees between the parties as the Arbitrator deems appropriate, whether or not this results in one party paying the whole or predominant amount of the fee.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(9) The language to be used in the arbitral proceedings shall be English.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                text: qsTr("(10) For the purposes of arbitral proceedings:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(a) all communications between the parties and the Arbitrator shall be sent from and received at their respective electronic addresses listed in Clauses (1) and (5); and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(b) periods of time shall be calculated by reference to Universal Time Coordinated, shall not include Saturdays or Sundays, and shall begin on the day following the day on which a statement of claim or statement of defence is sent; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(c) the party initiating proceedings (hereafter 'the Claimant') shall com- municate to the other party (hereafter 'the Respondent') and the Arbitrator a statement of claim setting out:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) the alleged factual and contractual basis of the claim; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) the amount involved, if any; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(iii) the relief or remedy sought; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Flow {
                id: flow3
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                Text {
                    text: qsTr("(d) within")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Response time")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("days of receiving the statement of claim, the Respondent shall")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("communicate to the Claimant and the Arbitrator a statement of defence setting out its response to the statement ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("of claim, and including:")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) any counterclaims; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) any amounts, relief or remedies sought; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(e) each party may amend or supplement its statement of claim or state- ment of defence at any point during the proceedings unless the Arbitrator considers it inappropriate on the basis that it would cause undue prejudice to the other party; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(f) subject to these rules, the Arbitrator shall conduct proceedings in whatever manner the Arbitrator considers appropriate, but must:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(i) treat each party equally and ensure each party has a reasonable opportunity of presenting its case; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(ii) conduct proceedings fairly, efficiently and without unnecessary delay; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                text: qsTr("(iii) respect the right of each party to protect their identity; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(g) the Arbitrator shall endeavour to have the proceedings concluded and to issue their determination:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Flow {
                id: flow4
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                Text {
                    text: qsTr("(i) within days of receiving the statement of defence; or")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Time if defended")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("days of receiving the statement of defence; or")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Flow {
                id: flow5
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                Text {
                    text: qsTr("(ii) if the Respondent does not provide a statement of defence, within")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    text: qsTr("Time if undefended")
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("days of")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("receiving the statement of claim; and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(h) if the Respondent does not provide a statement of defence, the Arbitrator shall find in favour of the Claimant.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr("Primary Obligations")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            Flow {
                id: flow6
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(11) The Vendor shall")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    id: vendorEdit
                    height: 30
                    width: 200
                }
                Button {
                    height: 30
                    width: 30
                    onClicked: {
                        vendorModel.append({"obligation": vendorEdit.text})
                    }
                }
            }
            ListView {
                id: vendorShallList
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: 60
                model: vendorModel
                height: 30 * vendorModel.count
                spacing: 5
                delegate: Row {
                    anchors.right: parent.right
                    anchors.left: parent.left
                    spacing: 5
                    Button {
                        height: 30
                        width: 30
                        onClicked: {
                            vendorModel.remove(index, 1)
                            vendorEdit.text = ""
                        }
                    }
                    Text {
                        text: "("+ abcd[index] + ") " + obligation
                        wrapMode: Text.WordWrap
                        font { family: localFont.name; pixelSize: 16; }
                        color: "#FFFFFF"
                    }
                }
            }
            Flow {
                id: flow7
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(12) The Vendee shall")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    id: vendeeEdit
                    height: 30
                    width: 200
                }
                Button {
                    height: 30
                    width: 30
                    onClicked: {
                        vendeeModel.append({"obligation": vendeeEdit.text})
                        vendeeEdit.text = ""
                    }
                }
            }
            ListView {
                id: vendeeShallList
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.leftMargin: 60
                model: vendeeModel
                height: 30 * vendeeModel.count
                spacing: 5
                delegate: Row {
                    anchors.right: parent.right
                    anchors.left: parent.left
                    spacing: 5
                    Button {
                        height: 30
                        width: 30
                        onClicked: {
                            vendeeModel.remove(index, 1)
                        }
                    }
                    Text {
                        text: "("+ abcd[index] + ") " + obligation
                        wrapMode: Text.WordWrap
                        font { family: localFont.name; pixelSize: 16; }
                        color: "#FFFFFF"
                    }
                }
            }
            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr("Intellectual Property")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            ButtonGroup { id: assignmentGroup }
            CustomRadioButton {
                id: assignment
                text: qsTr("Assignment")
                anchors.left: parent.left
                anchors.leftMargin: 30
                width: 230
                ButtonGroup.group: assignmentGroup
            }
            CustomRadioButton {
                id: noAssignment
                text: qsTr("No Assignment")
                anchors.left: parent.left
                anchors.leftMargin: 30
                width: 230
                ButtonGroup.group: assignmentGroup
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(13) Upon completion of this contract, the Vendor shall assign to the Vendee, to the fullest extent permitted by law, all intellectual property rights and claims to such rights that subsist in, or may arise from, materials created for and delivered to the Vendee in performance of this agreement, but the Vendor retains all rights necessary to include the material and parts thereof in a portfolio of the Vendor's works.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                visible: assignment.checked ? true: false
            }
            Text {
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                text: qsTr("(13) The parties agree that the Vendor has no intellectual property rights or claims to such rights in any material transferred between the parties for the purposes of performing this agreement, but the Vendor is permitted to include the material and parts thereof in a portfolio of the Vendor's works.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                visible: noAssignment.checked ? true: false
            }
            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr("Termination and Penalties")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
            }
            Flow {
                id: flow8
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(14) Either party may terminate this agreement by giving")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    id: daysNotice
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("days' notice.")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                text: qsTr("(15) Unless otherwise agreed in writing:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 30
            }
            Text {
                text: qsTr("(a) if the Vendee terminates this agreement, the vendor shall be entitled to the full contract price; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                visible: fullPrice.checked ? true: false
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Flow {
                id: flow9
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                visible: fixedAmount.checked ? true: false
                Text {
                    text: qsTr("(a) if the Vendee terminates this agreement, the vendor shall be entitled to")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr(", with the ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("remainder to be returned to the Vendee; and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                text: qsTr("(a) if the Vendee terminates this agreement, the vendor shall be entitled to a proportion of the contract price calculated by dividing the contract praice by the number of days of the contract term multiplied by the number of days that have accrued since the date of execution, with the remainder to be returned to the Vendee; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                visible: proRata.checked ? true: false
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
            }
            ButtonGroup { id: termination }
            CustomRadioButton {
                id: fullPrice
                text: qsTr("the full contract price")
                anchors.left: parent.left
                anchors.leftMargin: 60
                width: 230
                ButtonGroup.group: termination
                checked: true
            }
            CustomRadioButton {
                id: fixedAmount
                text: qsTr("a fixed amount")
                anchors.left: parent.left
                anchors.leftMargin: 60
                width: 230
                ButtonGroup.group: termination
            }
            CustomRadioButton {
                id: proRata
                text: qsTr("a pro rata amount")
                anchors.left: parent.left
                anchors.leftMargin: 60
                width: 230
                ButtonGroup.group: termination
            }
            Text {
                text: qsTr("(b) if the Vendor terminates this agreement, the Vendee shall be entitled to the whole of the contract price; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                visible: fullPrice2.checked ? true: false
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Flow {
                id: flow10
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                visible: fixedAmount2.checked ? true: false
                Text {
                    text: qsTr("(b) if the Vendor terminates this agreement, the Vendee shall be entitled to the whole of the contract price, and ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("per day that has accrued from the date of execution up to the value of the contract ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("price; and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            ButtonGroup { id: termination2 }
            CustomRadioButton {
                id: fullPrice2
                text: qsTr("the full contract price")
                anchors.left: parent.left
                anchors.leftMargin: 60
                width: 230
                ButtonGroup.group: termination2
                checked: true
            }
            CustomRadioButton {
                id: fixedAmount2
                text: qsTr("a fixed amount")
                anchors.left: parent.left
                anchors.leftMargin: 60
                width: 230
                ButtonGroup.group: termination2
            }
            Text {
                text: qsTr("(c) if the Vendor does not perform this agreement by the date of completion, the Vendee shall be entitled to:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Text {
                text: qsTr("(i) terminate the agreement at any time beyond the date of completion unless the Vendee has performed the agreement; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
            }
            Flow {
                id: flow11
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 90
                anchors.right: parent.right
                Text {
                    text: qsTr("(ii) deduct and reclaim")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("(or part thereof) from the contract price per day in")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("excess of the date of completion until the contract price becomes nil; and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                text: qsTr("(d) if the contract price has been wholly deducted and reclaimed in accordance with Clause 12(c)(ii) of this contract, the contract shall be terminated immediately.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                visible: additionalDamage.checked ? false: true
            }
            Flow {
                id: flow12
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                visible: additionalDamage.checked ? true: false
                Text {
                    text: qsTr("(d) if the contract price has been wholly deducted and reclaimed in accordance with Clause 12(c)(ii) of this")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                Text {
                    text: qsTr("contract, the contract shall be terminated immediately and the Vendor shall be entitled to additional damages of ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
            }
            CheckBox {
                id: additionalDamage
                text: qsTr("with additional damages")
                width: 120
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr("Escrow")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
            }
            Flow {
                id: flow13
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                Text {
                    text: qsTr("(16) Within ")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("days of the date of execution:")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Flow {
                id: flow14
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                Text {
                    text: qsTr("(a) the Vendee shall pay")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("to be held in escrow; and")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Flow {
                id: flow15
                spacing: 5
                anchors.left: parent.left
                anchors.leftMargin: 60
                anchors.right: parent.right
                visible: additionalDamage.checked ? true: false
                Text {
                    text: qsTr("(b) the Vendor shall pay")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
                LineEdit {
                    height: 30
                    width: 200
                }
                Text {
                    text: qsTr("to be held in escrow.")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
            Text {
                text: qsTr("(17) If either party defaults on its obligation to pay into escrow the amount specified within the time specified:")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 30
            }
            Text {
                text: qsTr("(a) the other party shall be entitled to terminate the agreement until the full amount is paid into escrow; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Text {
                text: qsTr("(b) each party shall be entitled to reclaim in fully any amounts already paid into escrow; and")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            Text {
                text: qsTr("(c) neither party shall be penalised or owe compensation to the other party.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 60
            }
            CheckBox {
                id: confidentiality
                text: qsTr("Include confidentiality clause")
                width: 120
            }
            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                text: qsTr("Confidentiality")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; bold: true }
                color: "#FFFFFF"
                visible: confidentiality.checked ? true: false
            }
            Text {
                text: qsTr("(18) The Vendor, the Vendee and the Arbitrator shall not disclose the terms of this contract to any person who is not a party to or the Arbitrator of this contract.")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
                color: "#FFFFFF"
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.right: parent.right
                visible: confidentiality.checked ? true: false
            }
        }
    }
    Rectangle {
        id: buttons
        height: 100
        width: parent.width
        anchors.bottom: parent.bottom
        color: "transparent"
        Button {
            text: qsTr("Submit Contract")
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 30
            height: 50
            width: 150
            anchors.right: cancel.left
        }
        Button {
            id: cancel
            text: qsTr("Cancel")
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 40
            height: 50
            width: 100
            anchors.right: parent.right
        }
    }
}
