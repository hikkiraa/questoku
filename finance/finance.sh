#!/bin/bash

sl() {
	sleep 0.005
	}

#dump

	echo -en "\033c"

	date=$(TZ=UTC-4 date +"%d%m")

	dates=("3101" "2802" "3103" "3004" "3105" "3006" "3107" "3108" "3009" "3110" "3011" "3112")

	for elem in "${dates[@]}"; do

		if [ $date = "$elem" ]; then

			nomoredate=$(cat copyprevent.txt)

			if [ $nomoredate = $elem ]; then
				echo -n ""
				else
					
				echo -n "time to dump numbers? (y/n) "
				read -n 1 dumpdes

				if [ $dumpdes = n ]; then
					echo -n ""
					
				elif [ $dumpdes = y ]; then
					
					incomes_now=$( cat incomes.txt )				
					expenses_now=$( cat expenses.txt )
					account_bank=$(cat account_bank.txt)
					account_cash=$(cat account_cash.txt)
					account_savings=$(cat account_savings.txt)
					balance=$(( $account_bank + $account_cash ))

					datedump=$(TZ=UTC-4 date +"[%Y %B]")

					echo $datedump >> archive/dump-finance.txt
					echo "" >> archive/dump-finance.txt

					findump() {
					echo -n "balance - "$balance
					echo ".000amd"
					echo -n "savings - "$account_savings
					echo ".000amd"
					echo ""
					echo -n "total incomes  - "$incomes_now
					echo ".000amd"
					echo -n "total expenses - "$expenses_now
					echo ".000amd"
					}
					findump >> archive/dump-finance.txt
					echo "" >> archive/dump-finance.txt
					echo "" >> archive/dump-finance.txt

					
					datefile=$(TZ=UTC-4 date +"%Y_%B")

					cat full_report.txt > archive/$datefile.txt

					echo $date > copyprevent.txt

					echo "0" > expenses.txt
					echo "0" > incomes.txt
					echo " " > full_report.txt

					echo ""
					echo ""
					sleep 1
					echo "monthly dump created."

					echo ""
					sleep 1
					echo -n "check "
					echo -en "\e[7m[a]\e[0m"
					echo -n " option later "
					sleep 3
				
					else
				
					./finanse.sh

				fi
				
			fi

		fi

	done

#start

		echo -en "\033c"

		for i in {1..40}; do
			echo ""
		done

		date=$(TZ=UTC-4 date +"%h %d [%I:%M%p]")
		
		account_bank=$(cat account_bank.txt)
		account_cash=$(cat account_cash.txt)
		account_savings=$(cat account_savings.txt)
		balance=$(( $account_bank + $account_cash ))

		incomes_now=$( cat incomes.txt )
		expenses_now=$( cat expenses.txt )

		cat full_report.txt
	sl
		echo ""
	sl
		echo ""
	sl
		echo -n "balance - "$balance
		echo ".000amd"
	sl
		echo ""
	sl
		echo -n "bank - "$account_bank; echo ".000amd"
	sl
		echo -n "cash - "$account_cash; echo ".000amd"
	sl
		echo ""
	sl
		echo -n "savings - "$account_savings
		echo "$"
	sl
		echo ""
	sl
		echo -n "total incomes  - "$incomes_now
		echo ".000amd"
	sl
		echo -n "total expenses - "$expenses_now
		echo ".000amd"
	sl
		echo ""
	sl
		echo ""
	sl

	echo -n "[home]  /  [i]  [e]  [t]  [more]  "
		read -n 1 action_finance

	#income
		if [ $action_finance = i ]; then

		echo -en "\033c"
		echo -e -n "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""
		echo -n "income to cash / bank "
		read -n 1 account
		echo ""

		#bank
			if [ $account = b ]; then

			echo ""
			echo -n "how many? "
			read plus

				if [ $plus = x ]; then
				./finance.sh
				else
					if [[ "$plus" =~ ^-?[0-9]+$ ]]; then
					if [ $plus -ge 0 ]; then
					echo ""
					echo -n "note "
					read note

					total=$(( $account_bank + $plus ))
					echo $total > account_bank.txt

					incomes_now=$( cat incomes.txt )
					incomes_total=$(( $incomes_now + $plus ))
					echo $incomes_total > incomes.txt

					echo $date "bank" "+ "$plus".000" $note >> full_report.txt
			
					./finance.sh
					fi
					else 
					./finance.sh
					fi
				fi

		#cash
			elif [ $account = c ]; then

			echo ""
			echo -n "how many? "
			read plus

				if [ $plus = x ]; then
				./finance.sh
				else
					if [[ "$plus" =~ ^-?[0-9]+$ ]]; then
					if [ $plus -ge 0 ]; then
					echo ""
					echo -n "note "
					read note

					total=$(( $account_cash + $plus ))
					echo $total > account_cash.txt

					incomes_now=$( cat incomes.txt )
					incomes_total=$(( $incomes_now + $plus ))
					echo $incomes_total > incomes.txt

					echo $date "cash" "+ "$plus".000" $note >> full_report.txt

					./finance.sh
					fi			
					else 			
					./finance.sh				
					fi
				fi	
			else
			./finance.sh
			fi

	#expense
		elif [ $action_finance = e ]; then

		echo -en "\033c"
		echo -e -n "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""
		echo -n "expense from cash / bank "
		read -n 1 account
		echo ""

		#bank
			if [ $account = b ]; then

			echo ""
			echo -n "how many? "
			read minus

				if [ $minus = x ]; then
				./finance.sh
				else
					if [[ "$minus" =~ ^-?[0-9]+$ ]]; then
					if [ $minus -ge 0 ]; then
					echo ""
					echo -n "note "
					read note

					total=$(( $account_bank - $minus ))
					echo $total > account_bank.txt

					expenses_now=$( cat expenses.txt )
					expenses_total=$(( $expenses_now + $minus ))
					echo $expenses_total > expenses.txt

					echo $date "bank" "- "$minus".000" $note >> full_report.txt
					./finance.sh
					fi
					else 
					./finance.sh
					fi
				fi

		#cash
			elif [ $account = c ]; then

			echo ""
			echo -n "how many? "
			read minus

				if [ $minus = x ]; then
				./finance.sh
				else
					if [[ "$minus" =~ ^-?[0-9]+$ ]]; then
					if [ $minus -ge 0 ]; then
					echo ""
					echo -n "note "
					read note

					total=$(( $account_cash - $minus ))
					echo $total > account_cash.txt

					expenses_now=$( cat expenses.txt )
					expenses_total=$(( $expenses_now + $minus ))
					echo $expenses_total > expenses.txt

					echo $date "cash" "- "$minus".000" $note >> full_report.txt

					./finance.sh
					fi
					else 
					./finance.sh
					fi
				fi
			else
			./finance.sh
			fi
		
	#transfer
		elif [ $action_finance = t ]; then

		echo -en "\033c"

		account_bank=$(cat account_bank.txt)
		account_cash=$(cat account_cash.txt)
		account_savings=$(cat account_savings.txt)
		balance=$(( $account_bank + $account_cash ))

		echo -e -n "\e[7m[x]\e[0m"
		echo " - cancel"; echo ""
		echo -n "from  cash / bank / savings  "
		read -n 1 from

		#cash-to
			if [ $from = c ]; then

			echo ""; echo ""
			echo -n "to    bank / savings  "
			read -n 1 to

			#bank
				if [ $to = b ]; then

				echo ""; echo ""
				echo -n "amount: "
				read amount

				if [ $amount = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_cash - $amount ))
				transfer_to=$(( $account_bank + $amount ))
				echo $transfer_from > account_cash.txt
				echo $transfer_to > account_bank.txt
				echo $date "cash > bank "$amount".000" >> full_report.txt

				./finance.sh
				
				fi
					
			#savings
				elif [ $to = s ]; then

				echo ""; echo ""
				echo -n "from _amd "
				read amount

				if [ $amount = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_cash - $amount ))
				echo -n "to _usd "
				read amount_usd
				transfer_to=$(( $account_savings + $amount_usd ))
				echo $transfer_from > account_cash.txt
				echo $transfer_to > account_savings.txt
				echo $date "cash > savings "$amount".000" >> full_report.txt
				
				./finance.sh

				fi
				
				else
				
				./finance.sh

				fi
			
		#bank-to
			elif [ $from = b ]; then

			echo ""; echo ""
			echo -n "to    cash / savings  "
			read -n 1 to

			#cash
				if [ $to = c ]; then

				echo ""; echo ""
				echo -n "amount: "
				read amount

				if [ $amount = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_bank - $amount ))
				transfer_to=$(( $account_cash + $amount ))
				echo $transfer_from > account_bank.txt
				echo $transfer_to > account_cash.txt
				echo $date "bank > cash "$amount".000" >> full_report.txt
				
				./finance.sh

				fi
					
			#savings
				elif [ $to = s ]; then

				echo ""; echo ""
				echo -n "from _amd "
				read amount

				if [ $amount = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_bank - $amount ))
				echo -n "to _usd "
				read amount_usd
				transfer_to=$(( $account_savings + $amount_usd ))
				echo $transfer_from > account_bank.txt
				echo $transfer_to > account_savings.txt
				echo $date "bank > savings "$amount".000" >> full_report.txt
				
				./finance.sh

				fi
				
				else 
				
				./finance.sh

				fi

		#savings-to
			elif [ $from = s ]; then

			echo ""; echo ""
			echo -n "to    cash / bank  "
			read -n 1 to

			#cash
				if [ $to = c ]; then

				echo ""; echo ""
				echo -n "from _usd "
				read amount_usd

				if [ $amount_usd = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_savings - $amount_usd ))
				echo -n "to _amd "
				read amount
				transfer_to=$(( $account_cash + $amount ))
				echo $transfer_from > account_savings.txt
				echo $transfer_to > account_cash.txt
				echo $date "savings > cash "$amount".000" >> full_report.txt
				
				./finance.sh

				fi
					
			#bank
				elif [ $to = b ]; then

				echo ""; echo ""
				echo -n "from _usd "
				read amount_usd

				if [ $amount_usd = x ]; then
				./finance.sh
				else

				transfer_from=$(( $account_savings - $amount_usd ))
				echo -n "to _amd "
				read amount
				transfer_to=$(( $account_bank + $amount ))
				echo $transfer_from > account_savings.txt
				echo $transfer_to > account_bank.txt
				echo $date "savings > bank "$amount".000" >> full_report.txt
				
				./finance.sh

				fi
				
				else 
					
				./finance.sh

				fi

			else
			
			./finance.sh

			fi

#finance_archive
	elif [ $action_finance = a ]; then

	for i in {1..40}; do
	        echo ""
	    done
		
	echo -e "\033c"
	cd archive/
	cat dump-finance.txt
	cd ..
	
	echo -n "[back]  "
	read -n 1 back
	
	./finance.sh

#home
	elif [ $action_finance = h ]; then
	
	for i in {1..40}; do
	        echo ""
	    done
	
	cd ..
	./app.sh
	
#report_edit
	elif [ $action_finance = c ]; then
	
	echo -e "\033c"
		echo "# leave empty line at the end #"; echo ""; echo ""
		echo "| your_text"
		echo "_ (last line here)"
		echo ""; echo ""; echo ""
		echo -n "press "
		echo -e -n "\e[7m[enter]\e[0m"
		echo -n " to continue "

		read -n 1
	
	nano +$(wc -l full_report.txt)
	./finance.sh

#report_archive
	elif [ $action_finance = l ]; then

	echo -en "\033c"
	cd archive/
	echo "archive:"; echo ""
	ls -1X
	echo ""; echo ""

	echo -e -n "\e[7m[x]\e[0m"
	echo " - cancel / type entire file name "
	echo ""
	read f_archive

	if [ $f_archive = x ]; then
	cd ..
	./finance.sh

	else

	for i in {1..40}; do
	echo ""
	done
	
	echo -e "\033c"
	echo $f_archive; echo ""
	cat $f_archive; echo ""
	echo -n "[back]  "
	read -n 1
	
	cd ..
	./finance.sh
	fi

#more
	elif [ $action_finance = m ]; then
	
	echo -en "\033c"
	cat more.txt
	
	for i in {1..5}; do
	        echo ""
	    done
	
	echo -n "[back]  "
	read -n 1 back
	
	./finance.sh

	else
	
	./finance.sh

	fi
 