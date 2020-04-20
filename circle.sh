# starting count for test start time
SECONDS=0
pabot_parallelism=3
status=0
success_exit=0
second_status_2=0
second_status_1=0
second_status_0=0

# clean previous output folder
rm -r ./results

echo
echo "# Running tests with tags circle2  first time #"
echo

pabot --processes 2 --outputdir results "$@"  -i circle2 -e staging ./Tests
# pabot --processes $pabot_parallelism --outputdir results "$@"  -i circle2 -e staging ./Tests
#robot --outputdir results $@  -i circle2 -e staging ./Tests
# we stop the script here if all the tests were OK
first_status_2=$?
echo "status first_status_2...." $first_status_2
if [ $first_status_2 -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	# we keep a copy of the first log file
	cp ./results/log.html  ./results/first_run_log2.html
	cp ./results/output.xml  ./results/output2.xml

elif [ $first_status_2 -ne 0 ]; then
	# otherwise we go for another round with the failing tests
	cp ./results/log.html  ./results/first_run_log2.html
	cp ./results/output.xml  ./results/output2.xml
	# we launch the tests that failed
	echo
	echo "# Running failed tests with tags circle2  second time #"
	echo
	pabot --processes 2 --outputdir results  --rerunfailed ./results/output2.xml --output rerun2.xml "$@" -i circle2  -e staging ./Tests
	# pabot --processes $pabot_parallelism --outputdir results  --rerunfailed ./results/output2.xml --output rerun2.xml "$@" -i circle2  -e staging ./Tests
	#robot --outputdir results --nostatusrc --rerunfailed ./results/output2.xml --output rerun2.xml $@  -i circle2  -e staging ./Tests
	# Robot Framework generates file rerun.xml
	second_status_2=$?

	echo "status second_status_2...." $second_status_2
	# we keep a copy of the second log file
	cp ./results/log.html  ./results/second_run_log2.html


	# Merging output files
	echo
	echo "# Merging circle2 output files #"
	echo
	rebot --nostatusrc --outputdir results --output output2.xml --merge ./results/output2.xml  ./results/rerun2.xml
	# Robot Framework generates a new output.xml
fi

echo
echo "# Running tests with tags circle1  first time #"
echo

pabot --processes 1 --outputdir results "$@"  -i circle1 -e staging ./Tests
#pabot --processes $pabot_parallelism --outputdir results "$@"  -i circle1 -e staging ./Tests
#robot --outputdir results $@  -i circle1 -e staging ./Tests
# we stop the script here if all the tests were OK
first_status_1=$?
echo "status first_status_1...." $first_status_1
if [ $first_status_1 -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	cp ./results/log.html  ./results/first_run_log1.html
	cp ./results/output.xml  ./results/output1.xml
elif [ $first_status_1 -ne 0 ]; then
	#exit 0
	# otherwise we go for another round with the failing tests
 	# we keep a copy of the first log file
	cp ./results/log.html  ./results/first_run_log1.html
	cp ./results/output.xml  ./results/output1.xml
	# we launch the tests that failed
	echo
	echo "# Running failed tests with tags circle1  second time #"
	echo
	#pabot --processes $pabot_parallelism --outputdir results  --rerunfailed ./results/output1.xml --output rerun1.xml "$@" -i circle1  -e staging ./Tests
	pabot --processes 1 --outputdir results  --rerunfailed ./results/output1.xml --output rerun1.xml "$@" -i circle1  -e staging ./Tests
	#robot --outputdir results --nostatusrc --rerunfailed ./results/output1.xml --output rerun1.xml $@  -i circle1  -e staging ./Tests
	second_status_1=$?
	# Robot Framework generates file rerun.xml
 	# we keep a copy of the second log file
	echo "status second_status_1...." $second_status_1
	cp ./results/log.html  ./results/second_run_log1.html
 	# Merging output files
	echo
	echo "# Merging circle1 output files #"
	echo
	rebot --nostatusrc --outputdir results --output output1.xml --merge ./results/output1.xml  ./results/rerun1.xml
	# Robot Framework generates a new output.xml
fi

echo
echo "# Running tests with tags circle  first time #"
echo

pabot --processes $pabot_parallelism --outputdir results "$@"  -i circle -e staging ./Tests
#robot --outputdir results $@  -i circle -e staging ./Tests
first_status_0=$?
echo "status first_status_0...." $first_status_0
 if [ $first_status_0 -eq 0 ]; then
	echo "we don't run the tests again as everything was OK on first try"
	cp ./results/log.html  ./results/first_run_log0.html
	cp ./results/output.xml  ./results/output0.xml
 elif [ $first_status_0 -ne 0 ]; then
	cp ./results/log.html  ./results/first_run_log0.html
	cp ./results/output.xml  ./results/output0.xml
 	# we launch the tests that failed
	echo
	echo "# Running failed tests with tags circle  second time #"
	echo
	pabot --processes $pabot_parallelism --outputdir results --rerunfailed ./results/output0.xml --output rerun0.xml "$@" -i circle -e staging ./Tests
	#robot --outputdir results --nostatusrc --rerunfailed ./results/output0.xml --output rerun0.xml $@  -i circle  -e staging ./Tests
 	second_status_0=$?
	echo "status second_status_0...." $second_status_0
	echo
	echo "# Merging circle output files #"
	echo
 	cp ./results/log.html  ./results/second_run_log0.html
 	rebot --nostatusrc --outputdir results --output output0.xml --merge ./results/output0.xml  ./results/rerun0.xml
 	#exit 0
fi

echo
echo "######################################"
echo "# Merging 3 output files into 1 file #"
echo "######################################"
echo
rebot --nostatusrc --outputdir results --output output.xml --merge  ./results/output2.xml  ./results/output1.xml  ./results/output0.xml
#rebot -N TwoCombinedTests --outputdir results --output output.xml  ./results/output2.xml  ./results/output1.xml  ./results/output0.xml

folder_name="./results/."
current_time=$(date "+%Y.%m.%d-%H.%M.%S")
echo "Current Time : $current_time"

#record end time of test end
diff=$SECONDS
#calculate the time taken to run the whole test run
time_elapsed="(dur-$(($diff / 3600))h:$((($diff / 60) % 60))m:$(($diff % 60))s)"


new_folderName="./1results-log-donotdelete/results-"$current_time-$time_elapsed

echo "New FolderName: " "$new_folderName"

cp -r $folder_name  $new_folderName

echo "You should see new file generated with timestamp on it.."

echo "second_status_2..." $second_status_2
echo "second_status_1..." $second_status_1
echo "second_status_0..." $second_status_0

status=$(( $second_status_2 + $second_status_1 + $second_status_0 ))

echo "Total Number of failed tests are...." $status

if [ $status -eq 0 ]; then
	echo "Success"
	exit 0	
else
	
	exit 1
fi
