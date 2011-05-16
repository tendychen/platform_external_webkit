!IF "$(BUILDSTYLE)"=="DEBUG"
BUILDSTYLE=Debug_All
!ELSE
BUILDSTYLE=Release_LTCG
!ENDIF

install:
	set WebKitLibrariesDir=$(SRCROOT)\AppleInternal
	set WebKitOutputDir=$(OBJROOT)
	set ConfigurationBuildDir=$(OBJROOT)\$(BUILDSTYLE)
	set WebKitVSPropsRedirectionDir=$(SRCROOT)\AppleInternal\tools\vsprops\OpenSource\1\2\ 
	set PRODUCTION=1
	devenv "WebKit2.submit.sln" /rebuild $(BUILDSTYLE)
	-xcopy "$(ConfigurationBuildDir)\bin\*.exe" "$(DSTROOT)\AppleInternal\bin\" /e/v/i/h/y
	xcopy "$(ConfigurationBuildDir)\bin\*.pdb" "$(DSTROOT)\AppleInternal\bin\" /e/v/i/h/y
	xcopy "$(ConfigurationBuildDir)\bin\*.dll" "$(DSTROOT)\AppleInternal\bin\" /e/v/i/h/y
	xcopy "$(ConfigurationBuildDir)\include\*" "$(DSTROOT)\AppleInternal\include\" /e/v/i/h/y	
	xcopy "$(ConfigurationBuildDir)\lib\*" "$(DSTROOT)\AppleInternal\lib\" /e/v/i/h/y
	-xcopy "$(ConfigurationBuildDir)\bin\WebKit2.resources\*" "$(DSTROOT)\AppleInternal\bin\WebKit2.resources" /e/v/i/h/y
	-mkdir "$(DSTROOT)\AppleInternal\Sources\WebKit2"
	xcopy "$(ConfigurationBuildDir)\obj\WebKit\DerivedSources\*" "$(DSTROOT)\AppleInternal\Sources\WebKit2" /e/v/i/h/y