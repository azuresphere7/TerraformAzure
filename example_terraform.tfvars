#################### VALUES ####################
########## SECRET VALUES ##########
#####  Declare confidential variables here
#####  Store secret values in *.tfvars file
#####  Check .gitingnore in repo for details
########## SECRET VALUES ##########
arm_tenant_id          = "YourTenantId"               // azure tenant id
arm_subscription_id    = "YourSubscriptionId"         // azure subscription id
arm_client_id          = "YourServicePrincipleId"     // azure service principle id
arm_client_secret      = "YourServicePrincipleSecret" // azure service principle secret
vm_localadmin_username = "YourAdminUsername"          // vm local admin username
vm_localadmin_password = "YourAdminPassword"          // vm local admin password

########## NON-DEFAULT VALUES ##########
##### main.tf values
lab_name              = "mylab"                 // defaults to 'mylab'
resource_group_region = "westus"                // defaults to 'westus'
vm_shutdown_hhmm      = "0000"                  // defaults to '0000' - aka midnight ;-)
vm_shutdown_tz        = "Pacific Standard Time" // defaults to 'Pacific Standard Time'

##### vm-jumpbox.tf values
# vm-jumpbox common values
vm_size = "Standard_D2s_v3" // defaults to 'Standard_D2s_v3'

# vm-jumpwin (fail if not unique in public DNS)
vm_jumpwin_hostname = "jumpwin007" // defaults to 'jumpwin007'

# vm-jumplin (fail if not unique in public DNS)
vm_jumplin_hostname = "jumpwin008" // defaults to 'jumpwin008'

##### vm-addc.tf value
vm_addc_size_addc   = "Standard_D2s_v3"            // vm addc size
vm_addc_hostname    = "vm-dc0150"                  // vm addc hostname, 15 character max
domain_name         = "your.fqdn.onmicrosoft.com"  // ad fqdn domain name
domain_netbios_name = "YourNetBIOSDomainName"      // ad netbios domain name
domain_admin_user   = "YourDomainAdminUserName"    // domwin admin username
domain_admin_pswd   = "YourDomainAdminPassword"    // domain admin password
safemode_admin_pswd = "YourDomainSafeModePassword" // domain safemode password

##### vm-sqlha.tf value
vm_sqlha_size                = "Standard_D2s_v3"    // vm sqlha size
vm_sqlha_hostname            = "vm-sqlha"           // vm sqlha hostname, 13 character max (*01 & *02)
sqlcluster_name              = "mysqlcluster"       // vm sqlha clustername, 12 character recommended
sql_sysadmin_login           = "sqllogin"           // sql sysadmin username
sql_sysadmin_password        = "P@ssword!2024"      // sql sysadmin password
sql_service_account_login    = "sqlsvc"             // sql service username
sql_service_account_password = "P@ssword!2024"      // sql service password
vm_sqlha_image_publisher     = "MicrosoftSQLServer" // vm sqlha image publisher
vm_sqlha_image_offer         = "sql2022-ws2022"     // vm sqlha image version
vm_sqlha_image_sku           = "sqldev-gen2"        // vm sqlha image sku
sqldatafilepath              = "K:\\Data"           // vm sqlha cluster dsk data path
sqllogfilepath               = "L:\\Logs"           // vm sqlha cluster dsk logs path
sqltempfilepath              = "T:\\Temp"           // vm sqlha cluster dsk temp path
sql_image_offer              = "SQL2022-WS2022"     // azure sql image offer
sql_image_sku                = "Developer"          // azure sql image sku

/*#################### NOTES ####################
How to generate a new Service Principle and Secret using PowershellAzAD

$sp = New-AzADServicePrincipal -DisplayName "Terraform" -Role "Contributor"
$sp.AppId 
$sp.PasswordCredentials.SecretText # Create Credential Secret

How to generate a new Service Principle and Secret using AZ AD SP

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$($myAzSubscriptionID)"
*/
