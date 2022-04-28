#!/bin/bash

# colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# contador
tests_passed=0

# funciones
test_output() {
  output=$($1)
  expected=$2
  if [[ "$output" == "$expected" ]]
  then
    echo -e "[  ${GREEN}OK${NC}  ]: $1 => $2 ${GREEN}✔️${NC}"
    tests_passed=$((tests_passed + 1))
  else
    echo -e "[ ${RED}Fail${NC} ]: Esperaba '$expected' pero se obtuvo '$output' ${RED}❌${NC}"
  fi
}
test_output_ml() {
  output=$($1)
  expected=$2
  if [[ "$output" == "$expected" ]]
  then
    echo -e "[  ${GREEN}OK${NC}  ]: $1 ${GREEN}✔️${NC}"
    tests_passed=$((tests_passed + 1))
  else
    echo -e "[ ${RED}Fail${NC} ]: $1 ${RED}❌${NC}"
  fi
}
# identidad
test_output_ml "./identidad 1" "1"
test_output_ml "./identidad 2" "10
01"
test_output_ml "./identidad 3" "100
010
001"
test_output_ml "./identidad 4" "1000
0100
0010
0001"
test_output_ml "./identidad 5" "10000
01000
00100
00010
00001"
test_output_ml "./identidad 6" "100000
010000
001000
000100
000010
000001"
test_output_ml "./identidad 7" "1000000
0100000
0010000
0001000
0000100
0000010
0000001"
test_output_ml "./identidad 8" "10000000
01000000
00100000
00010000
00001000
00000100
00000010
00000001"
test_output_ml "./identidad 9" "100000000
010000000
001000000
000100000
000010000
000001000
000000100
000000010
000000001"
test_output_ml "./identidad 10" "1000000000
0100000000
0010000000
0001000000
0000100000
0000010000
0000001000
0000000100
0000000010
0000000001"
# factorial
test_output "./factorial 0" "1"
test_output "./factorial 1" "1"
test_output "./factorial 2" "2"
test_output "./factorial 3" "6"
test_output "./factorial 4" "24"
test_output "./factorial -1" "Error"
test_output "./factorial 7" "5040"
test_output "./factorial 9" "362880"
test_output "./factorial 10" "3628800"
test_output "./factorial 12" "479001600"
# area
test_output "./area 0" "Error"
test_output "./area 100" "18.00"
test_output "./area 1" "0.00"
test_output "./area 10" "17.82"
test_output "./area 50" "17.99"
test_output "./area -1" "Error"
test_output "./area -100" "Error"
test_output "./area 10000" "18.00"
test_output "./area 25" "17.97"
test_output "./area 12" "17.88"



# resultado final
echo "--------------  Resultado  --------------"
if [[ $tests_passed -eq 30 ]]
then
  echo -e "Todos los tests pasaron ${GREEN}✔️${NC}"
else
  echo "Resultado: $tests_passed/30 tests OK."
fi
exit 0
