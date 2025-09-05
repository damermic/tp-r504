def puissance(a,b):
	
	if a == 0 and b <= 0:
		raise Exception("Puissance indéfinie pour 0 exposant négatif")
	if a == 0 and b == 0:
		raise Exception("0 puissance 0 est indéfinie")
	
	if type(a) is float or type(b) is float:
		return a**b
	
	if not type(a) is int or not type(b) is int:
		raise TypeError("Only integers are allowed")
	
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
	
	if b == 0:
		return 1
