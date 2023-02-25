@del default.n0vault 2> nul

@echo *******************************************************************************
@echo ***** Negative scenario of testing: Providing not paired parameters. Expected ERRORLEVEL == 1
@echo *******************************************************************************
python -m n0vault -d -s * -u adcb_pass1 value1 additional params will generate exception
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "1" @echo ##### Expected error, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: Providing paired parameters. Expected ERRORLEVEL == 0
@echo *******************************************************************************
python -m n0vault -d -s * -u adcb_pass1 value1
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: Providing 2 paired parameters. Expected ERRORLEVEL == 0
@echo *******************************************************************************
python -m n0vault -d -s * -u adcb_pass2 value2 -u adcb_pass3 value3
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

rem Below lines ONLY for manual testing
REM python -m n0vault -d -s * -u adcb_pass4
REM echo adcb_pass5 | python -m n0vault -s * -u
REM python -m n0vault -d -s * -u adcb_pass6 value6 -u adcb_pass7 value7 -u adcb_pass8
REM python -m n0vault -d -s * -u
REM python -m n0vault -d -s * -u adcb_pass10 value10 -u adcb_pass11 value11 -u adcb_pass12 -u

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group1/adcb_pass14 == value14
@echo *******************************************************************************
python -m n0vault -d -s * -u group1/adcb_pass14 value14
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group2/subgroup2_1/adcb_pass15 == value15
@echo *******************************************************************************
python -m n0vault -d -s * -u group2/subgroup2_1/adcb_pass15 value15
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group2/subgroup2_2/adcb_pass16 == value16
@echo *******************************************************************************
python -m n0vault -d -s * -u group2/subgroup2_2/adcb_pass16 value16
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
@echo *******************************************************************************
python -m n0vault -s /
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show all elements
@echo *******************************************************************************
python -m n0vault -s *
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show 1 element
@echo *******************************************************************************
python -m n0vault -s adcb_pass1
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show 1 element at the root
@echo *******************************************************************************
python -m n0vault -s /adcb_pass2
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show 1st group of elements
@echo *******************************************************************************
python -m n0vault -s /group1
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show 1 sub-element
@echo *******************************************************************************
python -m n0vault -s /group1/adcb_pass14
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: encrypt and save
@echo *******************************************************************************
python -m n0vault -e
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show 2nd group of elements
@echo *******************************************************************************
python -m n0vault -s /group2
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Positive scenario of testing: forbid to show and save
@echo *******************************************************************************
python -m n0vault -f
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEL%" == "0" @echo ##### Expected success, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Negative scenario of testing: demonstrate that it's not possible show elements
@echo *******************************************************************************
python -m n0vault -s /
@echo *** ERRORLEVEL=%ERRORLEVEL%
@if not "%ERRORLEVEl%" == "-1" @echo ##### Expected error, but received %errorlevel%. Continue is terminated. && exit /b -1

@echo *******************************************************************************
@echo ***** Successfully tested
@echo *******************************************************************************



