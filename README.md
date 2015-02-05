Apex Google Mirror API Framework
================================

<a href="https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googlemirror">
    <img alt="Deploy to Salesforce"
        src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>

Overview
--------

An Apex framework has been created to provide functionality for Google Mirror API callouts. 

This library extends the [Core](https://github.com/financialforcedev/ffhttp-core) library to provide access to Google Mirror API calls found at https://developers.google.com/glass/v1/reference/.

Samples demonstrating the use of this library can be found [here](https://github.com/financialforcedev/ffhttp-googlemirror-samples).

Key Features
------------

+ Apex Google Mirror API

Configuration
-------------

This section explains how to create a connection between Salesforce and Google Mirror using the packages described above.

Make sure that the [Core](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core) and [Google Mirror](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-googlemirror) packages have been deployed to your Saleforce organisation. 

###Create an app in Google

1. Log in to your Google account.
2. Go to https://console.developers.google.com/project and select **Create Project**.
3. Enter a project name and ok the dialog.
4. Select the hyperlink for the project name that you just created.
5. Expand the **APIs & auth** section.
6. Select **APIs**.
7. Enter **Mirror** in the **Browse APIs** section.
8. Turn the **Google Mirror API** on.
9. Select the **Consent screen**.
10. Enter a **Product Name**, make sure the **Email Address** is set and save.
11. Select **Credentials**.
12. Select **Create new Client ID**.
13. Select **Web application**.
14. Set the **Authorized Javascript Origins** url to the URL of the Salesforce organisation e.g. https://eu3.salesforce.com.
15. Set the **Authorized Redirect URIs** to the same as above with *apex/connector* appended: e.g. https://eu3.salesforce.com/apex/connector.
16. Make sure you know the **Client Id** and **Client Secret** as they will be needed later.

###Create a Connector in Salesforce

This requires the [OAuth Sample App](https://githubsfdeploy.herokuapp.com?owner=financialforcedev&repo=ffhttp-core-samples) to be deployed.

1. Log in to your Salesforce organisation.
2. Select the **OAuth** app.
3. Select **Connector Types** then **New**.
4. Enter a **Connector Type Name** e.g. Google Mirror.
5. Set the **Authorization Endpoint** to https://accounts.google.com/o/oauth2/auth. 
6. Set the **Token Endpoint** to https://accounts.google.com/o/oauth2/token.
7. Set the **Client ID** to the client ID obtained earlier.
8. Set the **Client Secret** to the client secret obtained earlier.
9. Set the **Redirect URI** to the same URL as you set in step 12 in the Create an app in Google section.
10. Make sure that **Scope Required** is checked.
11. For full access to Google Mirror add 'https://www.googleapis.com/auth/glass.location https://www.googleapis.com/auth/glass.timeline' as the scope.
12. Set the **Extra Url Parameters** to **access_type=offline&approval_prompt=force**. Setting **access_type** to offline means that Google supplies a refresh token with the access token which is required if you do not wish to reautheniticate every time the access token expires.
13. **Save** the Connector Type.
14. Select **New Connector**.
15. Set the **Connector Name** and save. 
16. Select the Connector and then **Activate**. You will be directed to another Salesforce page that activates your connector.
17. Select **Authorize**. This will prompt you to log in to your Google account (if you are not already logged in) and then authenticate the scope provided earlier. Select **Accept** to authorize. 
18. Select **Save**. The connector is now ready for use.

Note that authorization can be revoked at any point by either deleting the connector in Salesforce or  revoking access to the app in Google (Select your profile then Account > Security > Account Permissions > Apps and website (View All), choose the app created and then select **Revoke Access**).

###Google Mirror Scopes

To limit access to the Google Mirror functionality the following [scopes](https://developers.google.com/oauthplayground/) can be used.

+ https://www.googleapis.com/auth/glass.location

+ https://www.googleapis.com/auth/glass.timeline

Reporting Issues & Enhancements
-------------------------------

Please report any issues using the github [issues](https://github.com/financialforcedev/ffhttp-googlemirror/issues) feature. Suggestions / bug reports are welcome as are extensions containing additional functionality.
