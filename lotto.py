import random

def getNumber() :
    return random.randrange(1, 46)

lotto = []
num = 0

while True :
    num = getNumber()

    if lotto.count(num) == 0 :
        lotto.append(num)

    if len(lotto) >= 6 :
        break

lotto.sort()

print("로또 번호 6개를 입력하시오 ==> ", end = '')

lotto2 = []
num2 = 0

while True :
    num2 = input()
    num2_list = num2.split()

    for num in num2_list :
        num = int(num)
        
        if lotto2.count(num) == 0 :
            lotto2.append(num2)
            print(num)

    if len(lotto2) < 6 :
           break

match = []


for i in range(6) :
    if lotto[i] == lotto2[i] :
        match.append(lotto[i])

if len(match) == 0 :
    print("로또 번호를 맞추지 못했습니다")
elif len(match) == 1 :
    print("로또 번호를 1개 맞췄습니다")
elif len(match) == 2 :
    print("로또 번호를 2개 맞췄습니다")
elif len(match) == 3 :
    print("로또 번호를 3개 맞췄습니다")
elif len(match) == 4 :
    print("로또 번호를 4개 맞췄습니다")
elif len(match) == 5 :
    print("로또 번호를 5개 맞췄습니다")
elif len(match) == 6 :
    print("로또 번호를 모두 맞췄습니다")
