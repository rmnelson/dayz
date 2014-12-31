create procedure removeDamagedVehicles ()
begin
DELETE FROM `object_data` WHERE Damage = 1;
end;