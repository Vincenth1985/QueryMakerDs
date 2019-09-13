@echo off
setlocal enableextensions enabledelayedexpansion
cd /d "%~dp0"

title Dark Souls III Downpatcher By Petite_Miku

echo This downpatch will downgrade Dark Souls III from version 1.15 Regulation 1.35 to 1.04 Regulation 1.05.
echo Be sure to have at least 18 GB of free space for the downpatcher to work properly.
echo Please do not close this window while downgrading to avoid file corruption.
pause
echo.

rem Check if there is enough space on the drive.

@echo off

FOR /F "usebackq tokens=3" %%s IN (`DIR %~d0 /-C /-O /W`) DO (
	SET FREE_SPACE=%%s
)

rem convert bytes to gb
for /f "tokens=1 delims=,.'" %%N in ('powershell %FREE_SPACE%/1024/1024/1024') do (
	set FREE_SPACE_GB=%%N
)

set GB_NEEDED=18

echo Disk %~d0 Free: %FREE_SPACE_GB% GB, Needed: %GB_NEEDED% GB

IF %FREE_SPACE_GB% LSS %GB_NEEDED%  (
	ECHO Not enough space on your harddrive, please make sure there is 18GB of free space.
	pause
	exit
)

rem Check if the 2 jptch.exe, md5.exe and the folder with the files are present.

if not exist "jptch.exe" (
echo jptch.exe is not present. Redownload the patch or make sure jptch.exe is present.
goto :EpicFail
)
if not exist "md5.exe" (
echo md5.exe is not present. Redownload the patch or make sure md5.exe is present.
goto :EpicFail
)
if not exist "DarkSouls3PatchFiles" (
echo The folder named DarkSouls3PatchFiles is not present. Redownload the patch or make sure the folder is present.
goto :EpicFail
)

rem Amount of Files that will be patched and give them a variable.
set /a FILES_LENGHT=56
set "Files[0]=Game\Data0.bdt"
set "Files[1]=Game\Data0.bhd"
set "Files[2]=Game\Data1.bdt"
set "Files[3]=Game\Data1.bhd"
set "Files[4]=Game\Data2.bdt"
set "Files[5]=Game\Data2.bhd"
set "Files[6]=Game\Data3.bdt"
set "Files[7]=Game\Data3.bhd"
set "Files[8]=Game\Data5.bdt"
set "Files[9]=Game\Data5.bhd"
set "Files[10]=Game\DarkSoulsIII.exe"
set "Files[11]=Game\Data4.bdt"
set "Files[12]=Game\Data4.bhd"
set "Files[13]=Game\sound\fdp_vm35.fsb"
set "Files[14]=Game\sound\fdp_rm35.fsb"
set "Files[15]=Game\sound\fdp_rm30.fsb"
set "Files[16]=Game\sound\fdp_rm31.fsb"
set "Files[17]=Game\sound\fdp_rm32.fsb"
set "Files[18]=Game\sound\fdp_rm33.fsb"
set "Files[19]=Game\sound\fdp_rm34.fsb"
set "Files[20]=Game\sound\fdp_rm37.fsb"
set "Files[21]=Game\sound\fdp_rm39.fsb"
set "Files[22]=Game\sound\fdp_rm40.fsb"
set "Files[23]=Game\sound\fdp_rm41.fsb"
set "Files[24]=Game\sound\fdp_sm30.fsb"
set "Files[25]=Game\sound\fdp_sm31.fsb"
set "Files[26]=Game\sound\fdp_sm32.fsb"
set "Files[27]=Game\sound\fdp_sm33.fsb"
set "Files[28]=Game\sound\fdp_sm34.fsb"
set "Files[29]=Game\sound\fdp_sm35.fsb"
set "Files[30]=Game\sound\fdp_sm37.fsb"
set "Files[31]=Game\sound\fdp_sm38.fsb"
set "Files[32]=Game\sound\fdp_sm39.fsb"
set "Files[33]=Game\sound\fdp_sm40.fsb"
set "Files[34]=Game\sound\fdp_sm41.fsb"
set "Files[35]=Game\sound\fdp_xm39.fsb"
set "Files[36]=Game\sound\fdp_xm38.fsb"
set "Files[37]=Game\sound\fdp_xm37.fsb"
set "Files[38]=Game\sound\fdp_xm35.fsb"
set "Files[39]=Game\sound\fdp_smain.fsb"
set "Files[40]=Game\sound\fdp_vm30.fsb"
set "Files[41]=Game\sound\fdp_vm31.fsb"
set "Files[42]=Game\sound\fdp_vm32.fsb"
set "Files[43]=Game\sound\fdp_vm33.fsb"
set "Files[44]=Game\sound\fdp_vm34.fsb"
set "Files[45]=Game\sound\fdp_rm38.fsb"
set "Files[46]=Game\sound\fdp_vm37.fsb"
set "Files[47]=Game\sound\fdp_vm38.fsb"
set "Files[48]=Game\sound\fdp_vm39.fsb"
set "Files[49]=Game\sound\fdp_vm40.fsb"
set "Files[50]=Game\sound\fdp_vm41.fsb"
set "Files[51]=Game\sound\fdp_xm34.fsb"
set "Files[52]=Game\sound\fdp_xm33.fsb"
set "Files[53]=Game\sound\fdp_xm30.fsb"
set "Files[54]=Game\sound\fdp_xm31.fsb"
set "Files[55]=Game\sound\fdp_xm32.fsb"




rem The MD5 checksum of the Uptodate files.
set "MD5[0]=b39f07cda85895365e95d82199cb77ec"
set "MD5[1]=420610fdf102fb5e01dacf4f76a848b8"
set "MD5[2]=4e81899f41eae1f2e209446ee194ab1e"
set "MD5[3]=d9c79ebe4f59c1525ba4a8de8a2b6aed"
set "MD5[4]=27df62b6387b805cf4d9f31c67dd197a"
set "MD5[5]=8085ac2dd000b9a28fb2440b31d7f79d"
set "MD5[6]=7b08ed9b3a647a6ad7d16a65c9650592"
set "MD5[7]=34f43df65489bef759c1aa7cb613c557"
set "MD5[8]=37a74f331a061292e01a0ea0cc7b984f"
set "MD5[9]=be4c5422ab126079fd73ce424869cb70"
set "MD5[10]=ee2de9ea3f3871cf45502077f4765adb"
set "MD5[11]=a1b4593bc484694f3b23d660b838f0f2"
set "MD5[12]=65902031c7d5f5570450981e24293ec5"
set "MD5[13]=03c39f2d858b7bc37df1ea51e9ba65b2"
set "MD5[14]=672d4eedeadcb4759dc7a09221215ee4"
set "MD5[15]=1436629be0dc50521d49171b48337c04"
set "MD5[16]=5981a466fc142b851c6e924772520ab1"
set "MD5[17]=ac1f782fc469c76723662153db7f826e"
set "MD5[18]=6fe95fe86d1950e2c976cb124c1909ba"
set "MD5[19]=449d33a44dfa0869914fd9a6b474bbde"
set "MD5[20]=49895c82ded6f9c25b1d820f73e18f74"
set "MD5[21]=79ccffe313c2eaec407423be57d9e20e"
set "MD5[22]=e8dea7654ad169ef85bbf4b9018b5e36"
set "MD5[23]=f3e1b909153a4264fece3260d4bb7b14"
set "MD5[24]=bb127bcadf2de48acb2a25ebe12dec6b"
set "MD5[25]=07041b35e6ec016bc7d7c3943445402c"
set "MD5[26]=12d8f846a79d4397dfccd2f0eeaeff80"
set "MD5[27]=bcac3aedeb81bd3fc28d2b1c0f69ed9e"
set "MD5[28]=146827aef9aa269196d6a067d6a27b17"
set "MD5[29]=37616a57f1e68f6432644ed7b618bdd4"
set "MD5[30]=402b3a0784742b187de1b8426280e79d"
set "MD5[31]=8d40d814a92e3f635f17178148a3ea10"
set "MD5[32]=7701f24c2ba97299b5d0e0eff34261e2"
set "MD5[33]=9f19d990551f97ca8aadedce8ffa2d11"
set "MD5[34]=5d034c34f16c4ec97eb99bd43b6623e2"
set "MD5[35]=27d763fedc110fe2d03ca51d7aa3da0c"
set "MD5[36]=6a13d559498e46f74de79bbdd23047ec"
set "MD5[37]=00490781f6d5c620a15e8ee1d102f3d2"
set "MD5[38]=4a19544e855597268992b1276ac18eea"
set "MD5[39]=79064294f05f662f245dd6cbd1b0afdc"
set "MD5[40]=6bf113dd73a8d550bbbba797a5061b08"
set "MD5[41]=24c1f7424ca93d1adbedba0ac8666233"
set "MD5[42]=34524a39dd7ba634ef81a87f13888c2e"
set "MD5[43]=6fef66fb1549092798386f9f6a64fbed"
set "MD5[44]=168b86a1f5bee30d549736c21c267d47"
set "MD5[45]=31acaeeb5db645eefa510531ee22a1e9"
set "MD5[46]=e85d372b399dbceac3da1adecd07979e"
set "MD5[47]=10340120b6dd656fd57f0f8047207e9c"
set "MD5[48]=0ebc1cc6c85d553a82dccf16569ad915"
set "MD5[49]=808a9feed6e9ca36a780c47d63a0a6ba"
set "MD5[50]=5c533f36e4f0134f4586a7dd2770fc9d"
set "MD5[51]=091c4fc73c34347a60bbe16bb63edf97"
set "MD5[52]=b7a44ce9eee97f2fa86c499cac980ba3"
set "MD5[53]=2feb4c9764bbfcad8dc0bedc000a5cff"
set "MD5[54]=8817e17b7c30c08df8a3be60cc2ab595"
set "MD5[55]=aa0d526eda3a1870b77f185492537804"


rem The MD5 checksum of the older patch.
set "OLD_MD5[0]=90163f3968b5e1216e57ca16345aa0d2"
set "OLD_MD5[1]=47a77d7ed6577dbb2fa089abc7d3c0ad"
set "OLD_MD5[2]=3033001f1c91a94c49c06ea706b0c028"
set "OLD_MD5[3]=8b49f6dca2968a0e578337ac5449eede"
set "OLD_MD5[4]=9509bc63d88ee20e9ec8d00a229ab33c"
set "OLD_MD5[5]=12e407a709a38af4fde0582abacba321"
set "OLD_MD5[6]=75404c59f3426240974d15e791cbdd3f"
set "OLD_MD5[7]=5ddec52776631eb39b4cc3e9d0e68527"
set "OLD_MD5[8]=7a422ef4179fd01302bb9e5103c7e159"
set "OLD_MD5[9]=dd1aa14f35d7eef53732d9dd286f590b"
set "OLD_MD5[10]=8bb635a9d4dabbce06a14761f2a3c9ca"
set "OLD_MD5[11]=dc905e6602994b1c7e719526f8bf68e9"
set "OLD_MD5[12]=7f200e5a9590f54cb2ee1258b063fe65"
set "OLD_MD5[13]=23a437be342a5478dd633c759b45c7fc"
set "OLD_MD5[14]=3d5a8475c82649e47699094d150ee5ec"
set "OLD_MD5[15]=f8fcc65d3ad306c637faf460511616cc"
set "OLD_MD5[16]=50bcd124c1f867a72eb57c9cfba508ca"
set "OLD_MD5[17]=bbc182b4f72bb15fd83b715caebcb2ca"
set "OLD_MD5[18]=79b68712f65c7be0c37510a6eca78fed"
set "OLD_MD5[19]=e0237712999eb34aac3185b825303458"
set "OLD_MD5[20]=962922382456ccd67318171ac017006b"
set "OLD_MD5[21]=e81fa16f3f01ccb5dd5e54d220609647"
set "OLD_MD5[22]=c48ed9f661b78670e0fde13e0b28e74b"
set "OLD_MD5[23]=2d9cd1ce3baff894b8530569a76c03ab"
set "OLD_MD5[24]=8acb83ecf131191ceb21651aca1d6152"
set "OLD_MD5[25]=6bf9fe23f5b9ba14ecaea222724d7861"
set "OLD_MD5[26]=7b2d8a78161e786ac85014f109c58b33"
set "OLD_MD5[27]=2c84bfdf6fde0bdacac9ace3f1c93eea"
set "OLD_MD5[28]=e8956eaf5a531588aeccaeb1465a2191"
set "OLD_MD5[29]=78c10b7329b14840807263472e924486"
set "OLD_MD5[30]=25be56c3d37891466da17297b888abb4"
set "OLD_MD5[31]=a5c5722a5ce01932fec62ae5f5f5eb44"
set "OLD_MD5[32]=3c67ceb87dd6a581d4d673dcdeef64cf"
set "OLD_MD5[33]=0acc3165804731906ce0eea74f4f21d0"
set "OLD_MD5[34]=5436f4f9951cdbbb61036e6ce308684c"
set "OLD_MD5[35]=2905d3bf913402eabd5fb943be829230"
set "OLD_MD5[36]=94abf0b72e326c008586dc5c252ca95b"
set "OLD_MD5[37]=ea3ada368b8738da73ccd42a12443900"
set "OLD_MD5[38]=a687c1f9b7c96dc36d2e60ed3935cc95"
set "OLD_MD5[39]=28a8436d4788fb2a18a10617ac14b491"
set "OLD_MD5[40]=d8f762dccbc98dcaef0e2e43d26e9864"
set "OLD_MD5[41]=4d948e26d62298cb7fedc5bcaaa221e4"
set "OLD_MD5[42]=fb3bb9bb9db38909a904fe909357d35a"
set "OLD_MD5[43]=1c8e28607e360bdc113491aa71851a37"
set "OLD_MD5[44]=2f6f8b429a86e669a7f80dc9a8f8aade"
set "OLD_MD5[45]=3f00c62a9ea7da90de921854970855b7"
set "OLD_MD5[46]=c3d8e09669476521e95f8b20b79a0bb6"
set "OLD_MD5[47]=079be7f0d97c05fd926431a7ac74289b"
set "OLD_MD5[48]=cd950f7197dd351feb56190246d721fa"
set "OLD_MD5[49]=0e920677b412e686f8fa581e96b3c68a"
set "OLD_MD5[50]=61d16b1bd8c0ff1ab755915bbeba92a9"
set "OLD_MD5[51]=bc72755c5a2f66f658ceb80034a3a2d2"
set "OLD_MD5[52]=9b3c7e5fc9d911d65223e406e67e805c"
set "OLD_MD5[53]=bfae750e4592aaddf3b16b30b1e3591a"
set "OLD_MD5[54]=101a49d4f69442428679b57c240849d0"
set "OLD_MD5[55]=f9f05b5d4a87e16161a5185b25d1a44b"

rem Set this to 0 so it start counting from 0.
set i=0

rem This loop will check every file's MD5 to check if the user's version is the expected one.
rem It will then rename to original file and apply the patch with the original name as output.
:FilesLoop
set "File=!Files[%i%]!"
for %%f in ("%FILE%") do set FILE_NAME=%%~nf%%~xf
set MD5=!MD5[%i%]!
set OLD_MD5=!OLD_MD5[%i%]!

echo Checking "%File%" version...
if not exist "%File%" (
echo %File% is missing. Be sure the patch is in "Steam\steamapps\common\DARK SOULS III". If it is, verify game cache in steam.
goto :EpicFail
)

for /F "delims=" %%R in ('md5 -l -n "%FILE%"') do (
if "%%R" EQU "%OLD_MD5%" (
	echo File already patched, skipping.
	goto :Finished
	) else if "%%R" NEQ "%MD5%" (
		echo Invalid file. Wrong game version or corrupted file.
		echo md5: %%R
		goto :EpicFail
	)
echo File is good.
)

echo Backing up %File%...
echo Patching %File%...
jptch "%File%" "DarkSouls3PatchFiles\%FILE_NAME%.jdiff" "%File%.temp"
ren "%File%" "%FILE_NAME%.back"
ren "%File%.temp" "%FILE_NAME%"
echo %File% is patched.
goto :Finished

:Finished
set /a i=%i%+1
if %i% LSS %FILES_LENGHT% goto :FilesLoop
goto :TheEnd

:TheEnd
echo Do you wish to keep the backups of the current patch files?
echo 1 - Yes (Might take more than 10GB of space and is required for the Version Switcher.)
echo 2 - No (To retrieve the current patch files, use verify game cache in steam.)
set /p BackingUp=

set i=0

if "%BackingUp%" EQU "1" goto :OldBakDelete
if "%BackingUp%" NEQ "2" goto :TheEnd
if "%BackingUp%" EQU "2" goto :DeleteBakLoop

:OldBakDelete
if exist "game\Data0.bdt.bak" del "game\Data0.bdt.bak"
if exist "game\Data0.bhd.bak" del "game\Data0.bhd.bak"
if exist "game\Data1.bdt.bak" del "game\Data1.bdt.bak"
if exist "game\Data1.bhd.bak" del "game\Data1.bhd.bak"
if exist "game\Data2.bdt.bak" del "game\Data2.bdt.bak"
if exist "game\Data2.bhd.bak" del "game\Data2.bhd.bak"
if exist "game\Data3.bdt.bak" del "game\Data3.bdt.bak"
if exist "game\Data3.bhd.bak" del "game\Data3.bhd.bak"
if exist "game\Data5.bdt.bak" del "game\Data5.bdt.bak"
if exist "game\Data5.bhd.bak" del "game\Data5.bhd.bak"
if exist "game\DarkSoulsIII.exe.bak" del "game\DarkSoulsIII.exe.bak"
if exist "game\Data4.bdt.bak" del "game\Data4.bdt.bak"
if exist "game\Data4.bhd.bak" del "game\Data4.bhd.bak"
if exist "game\DLC1.bdt.bak" del "game\DLC1.bdt.bak"
if exist "game\DLC1.bhd.bak" del "game\DLC1.bhd.bak"
if exist "game\sound\fdp_vm35.fsb.bak" del "game\sound\fdp_vm35.fsb.bak"
if exist "game\sound\fdp_rm35.fsb.bak" del "game\sound\fdp_rm35.fsb.bak"
if exist "game\sound\fdp_xm45.fsb.bak" del "game\sound\fdp_xm45.fsb.bak"
if exist "game\sound\fdp_rm30.fsb.bak" del "game\sound\fdp_rm30.fsb.bak"
if exist "game\sound\fdp_rm31.fsb.bak" del "game\sound\fdp_rm31.fsb.bak"
if exist "game\sound\fdp_rm32.fsb.bak" del "game\sound\fdp_rm32.fsb.bak"
if exist "game\sound\fdp_rm33.fsb.bak" del "game\sound\fdp_rm33.fsb.bak"
if exist "game\sound\fdp_rm34.fsb.bak" del "game\sound\fdp_rm34.fsb.bak"
if exist "game\sound\fdp_rm37.fsb.bak" del "game\sound\fdp_rm37.fsb.bak"
if exist "game\sound\fdp_rm39.fsb.bak" del "game\sound\fdp_rm39.fsb.bak"
if exist "game\sound\fdp_rm40.fsb.bak" del "game\sound\fdp_rm40.fsb.bak"
if exist "game\sound\fdp_rm41.fsb.bak" del "game\sound\fdp_rm41.fsb.bak"
if exist "game\sound\fdp_rm45.fsb.bak" del "game\sound\fdp_rm45.fsb.bak"
if exist "game\sound\fdp_sm30.fsb.bak" del "game\sound\fdp_sm30.fsb.bak"
if exist "game\sound\fdp_sm31.fsb.bak" del "game\sound\fdp_sm31.fsb.bak"
if exist "game\sound\fdp_sm32.fsb.bak" del "game\sound\fdp_sm32.fsb.bak"
if exist "game\sound\fdp_sm33.fsb.bak" del "game\sound\fdp_sm33.fsb.bak"
if exist "game\sound\fdp_sm34.fsb.bak" del "game\sound\fdp_sm34.fsb.bak"
if exist "game\sound\fdp_sm35.fsb.bak" del "game\sound\fdp_sm35.fsb.bak"
if exist "game\sound\fdp_sm37.fsb.bak" del "game\sound\fdp_sm37.fsb.bak"
if exist "game\sound\fdp_sm38.fsb.bak" del "game\sound\fdp_sm38.fsb.bak"
if exist "game\sound\fdp_sm39.fsb.bak" del "game\sound\fdp_sm39.fsb.bak"
if exist "game\sound\fdp_sm40.fsb.bak" del "game\sound\fdp_sm40.fsb.bak"
if exist "game\sound\fdp_sm41.fsb.bak" del "game\sound\fdp_sm41.fsb.bak"
if exist "game\sound\fdp_sm45.fsb.bak" del "game\sound\fdp_sm45.fsb.bak"
if exist "game\sound\fdp_xm39.fsb.bak" del "game\sound\fdp_xm39.fsb.bak"
if exist "game\sound\fdp_xm38.fsb.bak" del "game\sound\fdp_xm38.fsb.bak"
if exist "game\sound\fdp_smain_dlc1.fsb.bak" del "game\sound\fdp_smain_dlc1.fsb.bak"
if exist "game\sound\fdp_xm37.fsb.bak" del "game\sound\fdp_xm37.fsb.bak"
if exist "game\sound\fdp_xm35.fsb.bak" del "game\sound\fdp_xm35.fsb.bak"
if exist "game\sound\fdp_smain.fsb.bak" del "game\sound\fdp_smain.fsb.bak"
if exist "game\sound\fdp_vm30.fsb.bak" del "game\sound\fdp_vm30.fsb.bak"
if exist "game\sound\fdp_vm31.fsb.bak" del "game\sound\fdp_vm31.fsb.bak"
if exist "game\sound\fdp_vm32.fsb.bak" del "game\sound\fdp_vm32.fsb.bak"
if exist "game\sound\fdp_vm33.fsb.bak" del "game\sound\fdp_vm33.fsb.bak"
if exist "game\sound\fdp_vm34.fsb.bak" del "game\sound\fdp_vm34.fsb.bak"
if exist "game\sound\fdp_vm35.fsb.bak" del "game\sound\fdp_vm35.fsb.bak"
if exist "game\sound\fdp_rm38.fsb.bak" del "game\sound\fdp_rm38.fsb.bak"
if exist "game\sound\fdp_vm37.fsb.bak" del "game\sound\fdp_vm37.fsb.bak"
if exist "game\sound\fdp_vm38.fsb.bak" del "game\sound\fdp_vm38.fsb.bak"
if exist "game\sound\fdp_vm39.fsb.bak" del "game\sound\fdp_vm39.fsb.bak"
if exist "game\sound\fdp_vm40.fsb.bak" del "game\sound\fdp_vm40.fsb.bak"
if exist "game\sound\fdp_vm41.fsb.bak" del "game\sound\fdp_vm41.fsb.bak"
if exist "game\sound\fdp_vm45.fsb.bak" del "game\sound\fdp_vm45.fsb.bak"
if exist "game\sound\fdp_xm34.fsb.bak" del "game\sound\fdp_xm34.fsb.bak"
if exist "game\sound\fdp_xm33.fsb.bak" del "game\sound\fdp_xm33.fsb.bak"
if exist "game\sound\fdp_xm30.fsb.bak" del "game\sound\fdp_xm30.fsb.bak"
if exist "game\sound\fdp_xm31.fsb.bak" del "game\sound\fdp_xm31.fsb.bak"
if exist "game\sound\fdp_xm32.fsb.bak" del "game\sound\fdp_xm32.fsb.bak"

goto :FinalRename

:FinalRename
set File=!Files[%i%]!
for %%f in ("%FILE%") do set FILE_NAME=%%~nf%%~xf
ren "%File%.back" "%FILE_NAME%.bak"
set /a i=%i%+1
if %i% LSS %FILES_LENGHT% goto :FinalRename
set i=0
goto :FinalMessage

:DeleteBakLoop
set File=!Files[%i%]!
del "%File%.back"
set /a i=%i%+1
if %i% LSS %FILES_LENGHT% goto :DeleteBakLoop

goto :FinalMessage

:FinalMessage
echo Thank you for using this downpatcher. Enjoy your downpatched game.
pause
exit /b 0

:EpicFail
echo I am sorry that something went wrong.
pause
exit /b 1
