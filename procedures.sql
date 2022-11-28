/*Create Account*/
create or replace procedure create_account
	(first_name in varchar, last_name in varchar, email_id in varchar, password in varchar, street in varchar, city in varchar, phone_number1 in number)
	is
	begin
	insert into customer values(cid.nextval, first_name, last_name, email_id, password, street, city,phone_number1);
		dbms_output.put_line('Your account has been created successfully.');
		commit;
	end;
	/

create or replace procedure cust_address
	(city in varchar, state in varchar)
	is
	begin
	insert into customer_address(city, state);
		commit;
	end;
	/

SET SERVEROUTPUT ON;
declare
first_name varchar; 
last_name varchar;
email_id varchar;
password varchar;
street varchar;
city varchar;
state varchar;
begin
	first_name:=&Enter_first_name;
	last_name:=&Enter_last_name;
	email_id:=&Enter_email_id;
	password:=&Enter_password;
	phone_number:=&Enter_phone_number;
	street:=&Enter_street;
	city:=&Enter_city;
	state:=&Enter_state;
	cust_address(city, state);
	create_account(first_name, last_name, email_id, password, street, city,phone_number);
end;
/


create procedure login
	(email in varchar, pass in varchar)
	as
	begin
	select email_id, password into from customer where email_id =email and password = pass;
	if sql%notfound then
		dbms_output.put_line('Invalid Login Credentials'); 
	else
		dbms_output.put_line('Login Successful.');
	end;
	/

SET SERVEROUTPUT ON;
declare
email varchar;
pass varchar;
begin
	email_id:=&Enter_email_id;
	password:=&Enter_password;
	login(email, pass);
end;
/




