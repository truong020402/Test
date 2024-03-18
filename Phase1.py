def expected_sum(lb_list, eb):
    dp = [[] for _ in range(eb + 1)]
    dp[0] = [[]]

    for lb in lb_list:
        for i in range(lb, eb + 1):
            for comb in dp[i - lb]:

                dp[i].append(comb+[lb])
                print(dp[i])
    return dp[eb]


#Nhập light brightness cách nhau bởi dấu ','
lb_list = list(map(int, input("\nEnter light brightness list: ").strip().split(',')))
eb = int(input("\nEnter expected brightness: ").strip())
"""
print("\nList is - ", lb_list)
print("\n eb :", eb)
"""

print(expected_sum(lb_list, eb))