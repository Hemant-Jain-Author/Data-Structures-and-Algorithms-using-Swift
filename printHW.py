
def pow(x, n):
	value = int()
	if n == 0:
		return (1)
	elif n % 2 == 0:
		value = pow(x, n / 2)
		return (value * value)
	else:
		value = pow(x, n / 2)
		return (x * value * value)

print pow(2,2)