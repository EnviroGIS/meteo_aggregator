file = open('trial.csv','r') #open th csv file
file_output = open ('test.txt','w') #define the output file

#number of values we want to count the average
max_n = int(raw_input('Enter the maximum number of days: '))

var_n = 0
for line in file:
    line = line.rstrip()
    value = line.split(';') #create a list from the input .csv file
    try:
        var_n = var_n + 1
        if var_n <= max_n - 1:    
            if var_n <= max_n - 1:
                locals()['v_'+str(var_n)] = value[6]    #6th element of the sample table
                                                        #may be defined as raw_input
                print locals()['v_'+str(var_n)]         #Don't do the couning for the previous values
                                                        #may be implemented
                file_output.write(line+';NA;NA\n')      #write the output file for no values
        elif int(var_n) >= int(max_n): #trying if we are ready to count
            locals()['v_'+str(max_n)] = value[6] #define the last element
            summ = 0
            #count the summ of all needed variables
            for i in range (1,max_n+1):
                s = locals()['v_'+str(i)]
                try: 
                    summ = summ + int(s)
                except:
                    print 'check the value'
            #change variables into the next one
            for i in range (1,max_n):            
                locals()['v_'+str(i)] = locals()['v_'+str(i + 1)]
            avg = float(summ) / max_n
            print 'Summ: ', summ, 'Average: ', avg
            file_output.write(line+';') #write the output file
            file_output.write(str(summ)+';') #write the output file
            file_output.write(str(avg)+'\n') #write the output file
    except:
        print 'Sorry, something wrong'