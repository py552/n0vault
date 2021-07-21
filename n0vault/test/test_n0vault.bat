@echo off

del default.n0vault
python -m n0vault -d -s * -u adcb_pass1 value1 additional params will generate exception
if not "%errorlevel%" == "1" echo Expected error, received %errorlevel%. Continue is terminated. && exit /b

python -m n0vault -d -s * -u adcb_pass1 value1
python -m n0vault -d -s * -u adcb_pass2 value2 -u adcb_pass3 value3 

rem Below lines ONLY for manual testing
REM python -m n0vault -d -s * -u adcb_pass4
REM echo adcb_pass5 | python -m n0vault -s * -u
REM python -m n0vault -d -s * -u adcb_pass6 value6 -u adcb_pass7 value7 -u adcb_pass8
REM python -m n0vault -d -s * -u
REM python -m n0vault -d -s * -u adcb_pass10 value10 -u adcb_pass11 value11 -u adcb_pass12 -u

python -m n0vault -d -s * -u group1/adcb_pass14 value14
python -m n0vault -d -s * -u group2/subgroup2_1/adcb_pass15 value15
python -m n0vault -d -s * -u group2/subgroup2_2/adcb_pass16 value16

python -m n0vault -s /          
python -m n0vault -s *
python -m n0vault -s adcb_pass1
python -m n0vault -s /adcb_pass2
python -m n0vault -s /group1
python -m n0vault -s /group1/adcb_pass14
python -m n0vault -s /group2

python -m n0vault -f
python -m n0vault -s /          
if not "%errorlevel%" == "-1" echo Expected error, received %errorlevel%. Continue is terminated. && exit /b


echo *** Successfully tested



