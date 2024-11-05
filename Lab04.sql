use master
go

use Lab04
go

-- Bài 1
-- 1.
select MaMH, TenMH, Sotiet from MonHoc
go

-- 2.
select MaSV, HoSV, TenSV, HocBong from SinhVien order by MaSV ASC
go

-- 3.
select MaSV, TenSV, Phai, NgaySinh from SinhVien order by TenSV ASC
go

-- 4.
select HoSV, TenSV, NgaySinh, HocBong from SinhVien order by NgaySinh ASC, HocBong DESC
go

-- 5.
select MaMH, TenMH, Sotiet from MonHoc where TenMH like 'T%'
go

-- 6.
select HoSV, TenSV, NgaySinh, Phai from SinhVien where TenSV like '%i'
go

-- 7.
select MaKH, TenKH from Khoa where TenKH like '_N%'
go

-- 8.
select * from SinhVien where CONCAT(HoSV, ' ', TenSV) like '%Thị%'
go

-- 9.
select MaSV, HoSV, TenSV, Phai, HocBong from SinhVien where TenSv like '[a-m]%'
go

-- 10.
select HoSV, TenSV, NgaySinh, NoiSinh, HocBong from SinhVien where TenSV like '[a-m]%' order by CONCAT(HoSV, ' ', TenSV) ASC
go

-- 11.
select MaSV, HoSV, TenSV, NgaySinh, MaKH from SinhVien where MaKH like '%AV%'
go

-- 12.
select MaSV, HoSV, TenSV, NgaySinh from SinhVien order by NgaySinh DESC
go

-- 13.
select MaSV, HoSV, TenSV, MaKH, HocBong from SinhVien where HocBong > 500000 order by MaKH DESC
go

-- 14.
select HoSV, TenSV, MaKH, HocBong from SinhVien where NgaySinh = '1987-12-20'
go

-- 15.
select HoSV, TenSV, NgaySinh, NoiSinh, HocBong from SinhVien where NgaySinh > '1977-12-20' order by NgaySinh DESC
go

-- 16.
select HoSV, TenSV, MaKH, NoiSinh, HocBong from SinhVien where HocBong > 100000 and NoiSinh = '%Tp. HCM%'
go

-- 17.
select MaSV, MaKH, Phai from SinhVien where MaKH like '%AV%' or MaKH like'%TR%'
go

-- 18.
select MaSV, NgaySinh, NoiSinh, HocBong from SinhVien where NgaySinh between '1986-01-01' and '1992-06-05'
go

-- 19.
select MaSV, NgaySinh, Phai, MaKH from SinhVien where HocBong between 200000 and 800000
go

-- 20.
select MaMH, TenMH, Sotiet from MonHoc where Sotiet > 40 and Sotiet < 60
go

-- 21.
select MaSV, HoSV, TenSV, Phai from SinhVien where MaKH like '%AV%'
go

-- 22.
select HoSV, TenSV, NoiSinh, NgaySinh from SinhVien where NoiSinh like '%Hà Nội%' and NgaySinh > '1990-01-01'
go

-- 23.
select * from SinhVien where TenSV like '%N%' and Phai=1
go

-- 24.
select * from SinhVien where Phai=0 and NgaySinh > '1986-05-30'
go

-- 25.
select HoSV, TenSV, Phai, NgaySinh, IIF(Phai=1, N'TRUE', IIF(Phai=0, N'FALSE', N'NULL')) from SinhVien
go

-- 26.
select MaSV, YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, NoiSinh, MaKH from SinhVien
go

-- 27.
select HoSV, TenSV, YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, HocBong from SinhVien where YEAR(GETDATE()) - YEAR(NgaySinh) > 20
go

-- 28.
select HoSv, TenSV, YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, MaKH from SinhVien where YEAR(GETDATE()) - YEAR(NgaySinh) between 20 and 30
go

-- Bài 2
-- 1.