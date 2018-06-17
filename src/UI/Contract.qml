import QtQuick 2.5
import QtQuick.Window 2.1
import QtQuick.Controls 2.4
import "Components/"
Window {
    id: window
    height: 1000
    width: 800
    color: "#0c0c0c"
    title: "Contract Window"
    FontLoader { id: localFont; source: "fonts/Source_Sans_Pro/SourceSansPro-Regular.ttf" }
    Text {
        id: windowTitle
        text: qsTr("HiveProtected Contract Template")
        anchors.horizontalCenter: parent.horizontalCenter
        font { family: localFont.name; pixelSize: 16; bold: true }
        color: "#FFFFFF"
        anchors.top: parent.top
        anchors.topMargin: 20
    }
    ScrollView {
        id: contractContent
        anchors.top: windowTitle.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.right: parent.right
        anchors.bottom: buttons.top
        contentHeight: contractLayout.height
        ScrollBar.vertical: ScrollBar { id: vbar; clip: true }
        clip: true
        Column {
            id: contractLayout
            anchors.rightMargin: 10
            spacing: 10
            anchors.fill: parent
            Text {
                text: qsTr("Parties")
                wrapMode: Text.WordWrap
                font { family: localFont.name; pixelSize: 16; }
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
                font { family: localFont.name; pixelSize: 16; }
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
                font { family: localFont.name; pixelSize: 16; }
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
                anchors.leftMargin: 30
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
                    text: qsTr("communicate to the Claimant and the Arbitrator a statement of defence setting out its response to the statement of claim, and including:")
                    wrapMode: Text.WordWrap
                    font { family: localFont.name; pixelSize: 16; }
                    color: "#FFFFFF"
                }
            }
        }
    }
    Rectangle {
        id: buttons
        height: 100
        width: parent.width
        anchors.bottom: parent.bottom
    }
}
