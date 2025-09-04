def puissance(a,b):
	if not type(a) is int or not type(b) is int:
		raise TypeError("Only integers are allowed")
	if a == 0 and b < 0:
		raise Exception("Puissance indéfinie pour 0 exposant négatif")
	if b > 0:
		res = 1
		for i in range(b):
			res *= a
		return res
	if b < 0:
		res = 1
		for i in range(-b):
			res *= a
		return 1/res
