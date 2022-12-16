pluginkit -mAvvv -p com.apple.authentication-services-credential-provider-ui | grep Path | grep -o '/.*'
pluginkit -mAvvv -p com.apple.Safari.web-extension | grep Path | grep -o '/.*' 
pluginkit -mAvvv -p com.apple.AppSSO.idp-extension | grep -v /System | grep Path | grep -o '/.*' 
defaults read /Library/SystemExtensions/db.plist | grep originPath | cut -d '"' -f2
