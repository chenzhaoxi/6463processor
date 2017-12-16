@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto 4253e82b31da472ea40b36bcc7c0ae83 -m64 --debug typical --relax --mt 2 --maxdelay -L xil_defaultlib -L work -L simprims_ver -L secureip --snapshot tb_processor_time_synth -transport_int_delays -pulse_r 0 -pulse_int_r 0 -pulse_e 0 -pulse_int_e 0 work.tb_processor work.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
