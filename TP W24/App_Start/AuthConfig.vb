Imports Microsoft.AspNet.Membership.OpenAuth

Public Module AuthConfig
    Sub RegisterOpenAuth()



        ' Consultez http://go.microsoft.com/fwlink/?LinkId=252803 pour plus de détails sur la configuration de cette application ASP.NET
        ' afin qu'elle prenne en charge la connexion par l'intermédiaire de services externes.

        'OpenAuth.AuthenticationClients.AddTwitter(
        '    consumerKey:= "votre consumer key Twitter",
        '    consumerSecret:= "votre consumer secret Twitter")

        OpenAuth.AuthenticationClients.AddFacebook(
            appId:="155567074550166",
            appSecret:="90e9e6df005f20b5a193c36d23fd713f")

        'OpenAuth.AuthenticationClients.AddMicrosoft(
        '    clientId:= "votre ID client pour votre compte Microsoft",
        '    clientSecret:= "votre client secret pour votre compte Microsoft")

        'OpenAuth.AuthenticationClients.AddGoogle()
    End Sub
End Module
