-- Tập trung vào DA
-- Thay đổi các tên viết tắt của cột experience_level
UPDATE final
SET experience_level = 'EN-Entry/Junior' WHERE experience_level = 'EN'
UPDATE final
SET experience_level = 'SE-Senior/Expert' WHERE experience_level = 'SE'
UPDATE final
SET experience_level = 'MI-Mid/Intermediate' WHERE experience_level = 'MI'
UPDATE final
SET experience_level = 'EX-Executive/Director' WHERE experience_level = 'EX'
-- Thay đổi các giá trị viết tắt của cột employment_type
UPDATE final
SET employment_type = 'Part time' WHERE employment_type = 'PT'
UPDATE final
SET employment_type = 'Full time' WHERE employment_type = 'FT'
UPDATE final
SET employment_type = 'Contract' WHERE employment_type = 'CT'
UPDATE final
SET employment_type = 'Freelance' WHERE employment_type = 'FL'
-- Liên kết 2 bảng lại để lấy ra tên nước
SELECT 
    fn.*,
    cc.Country AS employees_residence,
    ccd.Country AS companys_location
FROM final fn 
LEFT JOIN country_code cc ON fn.employee_residence = cc.alpha_code2
LEFT JOIN country_code ccd ON fn.company_location = ccd.alpha_code2
-- Xoá hai cột không viết tắt (employee_residence và company_location)
ALTER TABLE final_updated
DROP COLUMN employee_residence, company_location

