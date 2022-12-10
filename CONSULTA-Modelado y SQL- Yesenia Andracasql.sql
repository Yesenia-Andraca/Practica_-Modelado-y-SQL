select m.model, 
	   b.brand, 
	   com.company, 
	   ca.purchase_date,  
	   ca.license_plate, 
	   co.color, 
	   ca.km_total, 
	   ic.insurance_company, 
	   i.insurance_number
from yesenia_andraca.companies as com
join yesenia_andraca.brands as b on com.id_company = b.id_company
join yesenia_andraca.models as m on b.id_brand = m.id_brand
join yesenia_andraca.company_cars as ca on m.id_model = ca.id_model
join yesenia_andraca.car_colors as co on ca.id_color = co.id_color
join yesenia_andraca.insurances as i on i.id_car = ca.id_car
join yesenia_andraca.insurance_company  as ic on i.id_inscompany  = ic.id_inscompany 