
#!/bin/sh
#
# List All Credential Providers
credentialprovider=`pluginkit -mAvvv -p com.apple.authentication-services-credential-provider-ui | grep Path | grep -o '/.*'`;echo "<result>$credentialprovider</result>"
#
# List Safari Extensions
safariextensions=`pluginkit -mAvvv -p com.apple.Safari.web-extension | grep Path | grep -o '/.*' `;echo "<result>$safariextensions</result>"
#
# List SSO Extensions
ssoextensions=`pluginkit -mAvvv -p com.apple.AppSSO.idp-extension | grep -v /System | grep Path | grep -o '/.*' `;echo "<result>$ssoextensions</result>"
#
#List System Extensions 
systemextensions=`defaults read /Library/SystemExtensions/db.plist | grep originPath | cut -d '"' -f2`;echo "<result>$systemextensions</result>"
