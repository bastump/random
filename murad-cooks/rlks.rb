package 'redhat-lsb-core'
package 'unzip'

execute 'download-media' do
    command 'curl -Lk https://ibm.box.com/shared/static/yvaemewtrcfahtm52u67c98m1kus0ty8.zip > rlks.zip'
    creates 'rlks.zip'
end

execute 'unpack-media' do
    command 'unzip rlks.zip'
end

file 'install-rlks.rsp' do
    content <<-EOF
        <?xml version="1.0" encoding="UTF-8"?>
        <!--The "acceptLicense" attribute has been deprecated. Use "-acceptLicense" command line option to accept license agreements.-->
        <agent-input acceptLicense='true'>
        <preference name='com.ibm.cic.common.core.preferences.eclipseCache' value='/opt/IBM/IBMIMShared'/>
        <preference name='com.ibm.cic.common.core.preferences.connectTimeout' value='30'/>
        <preference name='com.ibm.cic.common.core.preferences.readTimeout' value='45'/>
        <preference name='com.ibm.cic.common.core.preferences.downloadAutoRetryCount' value='0'/>
        <preference name='offering.service.repositories.areUsed' value='true'/>
        <preference name='com.ibm.cic.common.core.preferences.ssl.nonsecureMode' value='false'/>
        <preference name='com.ibm.cic.common.core.preferences.http.disablePreemptiveAuthentication' value='false'/>
        <preference name='http.ntlm.auth.kind' value='NTLM'/>
        <preference name='http.ntlm.auth.enableIntegrated.win32' value='true'/>
        <preference name='com.ibm.cic.common.core.preferences.preserveDownloadedArtifacts' value='false'/>
        <preference name='com.ibm.cic.common.core.preferences.keepFetchedFiles' value='false'/>
        <preference name='PassportAdvantageIsEnabled' value='false'/>
        <preference name='com.ibm.cic.common.core.preferences.searchForUpdates' value='false'/>
        <preference name='com.ibm.cic.agent.ui.displayInternalVersion' value='false'/>
        <preference name='com.ibm.cic.common.sharedUI.showErrorLog' value='true'/>
        <preference name='com.ibm.cic.common.sharedUI.showWarningLog' value='true'/>
        <preference name='com.ibm.cic.common.sharedUI.showNoteLog' value='true'/>
        <server>
        <repository location='/tmp/RLKSSERVER_SETUP_LINUX_X86/disk1'/>
        </server>
        <profile id='IBM Rational RLKS' installLocation='/opt/IBM/RationalRLKS'>
        <data key='eclipseLocation' value='/opt/IBM/RationalRLKS'/>
        <data key='user.import.profile' value='false'/>
        <data key='cic.selector.os' value='linux'/>
        <data key='cic.selector.arch' value='x86'/>
        <data key='cic.selector.ws' value='gtk'/>
        <data key='cic.selector.nl' value='en'/>
        </profile>
        <install modify='false'>
        <offering id='com.ibm.rational.license.key.server.linux.x86' version='8.1.4000.20130823_0513' profile='IBM Rational RLKS' features='com.ibm.rational.license.key.server.feature' installFixes='none'/>
        </install>
        </agent-input>
    EOF
end

