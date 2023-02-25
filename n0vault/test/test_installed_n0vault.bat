@del default.n0vault 2> nul

@echo *******************************************************************************
@echo ***** Negative scenario of testing: Providing not paired parameters. Expected ERRORLEVEL == 1
python -m n0vault -d -s * -u adcb_pass1 value1 additional params will generate exception
@if not "%ERRORLEVEL%" == "1" echo Expected error, received %errorlevel%. Continue is terminated. && exit /b
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: Providing paired parameters. Expected ERRORLEVEL == 0
python -m n0vault -d -s * -u adcb_pass1 value1
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: Providing 2 paired parameters. Expected ERRORLEVEL == 0
python -m n0vault -d -s * -u adcb_pass2 value2 -u adcb_pass3 value3
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

rem Below lines ONLY for manual testing
REM python -m n0vault -d -s * -u adcb_pass4
REM echo adcb_pass5 | python -m n0vault -s * -u
REM python -m n0vault -d -s * -u adcb_pass6 value6 -u adcb_pass7 value7 -u adcb_pass8
REM python -m n0vault -d -s * -u
REM python -m n0vault -d -s * -u adcb_pass10 value10 -u adcb_pass11 value11 -u adcb_pass12 -u

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group1/adcb_pass14 == value14
python -m n0vault -d -s * -u group1/adcb_pass14 value14
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group2/subgroup2_1/adcb_pass15 == value15
python -m n0vault -d -s * -u group2/subgroup2_1/adcb_pass15 value15
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: definition of group2/subgroup2_2/adcb_pass16 == value16
python -m n0vault -d -s * -u group2/subgroup2_2/adcb_pass16 value16
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s /
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s *
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s adcb_pass1
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s /adcb_pass2
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s /group1
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s /group1/adcb_pass14
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -s /group2
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Positive scenario of testing: show elements at the root of tree
python -m n0vault -f
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Negative scenario of testing: Providing not paired parameters. Expected ERRORLEVEL == 1
python -m n0vault -s /
if not "%ERRORLEVEl%" == "-1" echo Expected error, received %errorlevel%. Continue is terminated. && exit /b
@echo *** ERRORLEVEL=%ERRORLEVEL%
pause

@echo *******************************************************************************
@echo ***** Successfully tested
@echo *******************************************************************************



