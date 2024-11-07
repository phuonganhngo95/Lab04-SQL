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
select HoSV, TenSV, IIF(Phai=1, N'FALSE', IIF(Phai=0, N'TRUE', N'NULL')) as GioiTinh, YEAR(GETDATE()) - YEAR(NgaySinh) as Tuoi, MaKH from SinhVien order by YEAR(GETDATE()) - YEAR(NgaySinh) DESC
go

-- 2.
select CONCAT(HoSV, ' ', TenSV), Phai, DAY(NgaySinh) as Ngay from SinhVien where MONTH(NgaySinh) = 2
go

-- 3.
select * from SinhVien order by NgaySinh DESC
go

-- 4.
select MaSV, Phai, MaKH,
iif(HocBong > 500000, N'Học bổng cao', N'Mức trung bình')
from SinhVien
go

-- 5.
SELECT CONCAT(HoSV, ' ', TenSV) as HoTen, SV.MaKH, MAX(KQ.Diem) as Diem
from SinhVien SV
join Ketqua KQ ON SV.MaSV = KQ.MaSV
join MonHoc MH ON MH.MaMH = KQ.MaMH
group by SV.MaSV, SV.MaKH, HoSV, TenSV
order by HoTen ASC;
go

-- 6.
select CONCAT(HoSv, ' ', TenSV) as HoTen, KH.TenKH, IIF(Phai=1, N'Nam', IIF(Phai=0, N'Nữ', N'NULL')) as GioiTinh
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where KH.MaKH like '%AV%'
go

-- 7.
select KH.TenKH, CONCAT(HoSV, ' ', TenSV) as HoTen, MH.TenMH, MH.Sotiet, KQ.Diem
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on MH.MaMH = KQ.MaMH
where KH.MaKH like '%TH%'
go

-- 8.
select SV.HoSV, SV.TenSV, SV.MaKH, MH.TenMH, KQ.Diem,
iif(KQ.Diem > 8, N'Giỏi', iif(KQ.Diem > 6, N'Khá', N'Trung bình')) as Loai
from SinhVien SV
inner join Ketqua KQ on SV.MaSV =KQ.MaSV
inner join MonHoc MH on MH.MaMH = KQ.MaMH
go

-- Bài 3
-- 1.
select MH.MaMH, TenMH, AVG(Diem) from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
group by MH.MaMH, TenMH
go

-- 2.
select CONCAT(HoSV, ' ', TenSV) as HoTen, KH.TenKH, COUNT(MaMH) as TongMH
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
group by CONCAT(HoSV, ' ', TenSV), KH.TenKH
go

-- 3.
select SV.TenSV, KH.TenKH, SV.Phai, SUM(KQ.Diem) as TongDiem
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
group by TenSV, KH.TenKH, Phai
go

-- 4.
select KH.TenKH, COUNT(MaSV) as TongSV
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
group by KH.TenKH
go

-- 5.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, MAX(KQ.Diem) as MaxDiem
from SinhVien SV
left join Ketqua KQ on SV.MaSV = KQ.Diem
group by CONCAT(SV.HoSV, ' ', SV.TenSV)
go

-- 6.
select top 1 TenMH, Sotiet from MonHoc order by Sotiet DESC
go

-- 7.
select KH.MaKH, KH.TenKH, MAX(SV.HocBong) as MaxHocBong
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
group by KH.MaKH, KH.TenKH
go

-- 8.
select MH.TenMH, MAX(KQ.Diem) as MaxDiem
from MonHoc MH
inner join Ketqua KQ on KQ.MaMH = MH.MaMH
group by MH.TenMH
go

-- 9.
select MH.MaMH, MH.TenMH, COUNT(SV.TenSV) as CountSV
from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
inner join SinhVien SV on KQ.MaSV = SV.MaSV
group by MH.MaMH, MH.TenMH
go

-- 10.
select top 1 MH.TenMH, MH.Sotiet, SV.TenSV, MAX(KQ.Diem) as MaxDiem
from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
inner join SinhVien SV ON KQ.MaSV = SV.MaSV
group by MH.TenMH, MH.Sotiet, SV.TenSV
order by MaxDiem DESC;
go

-- 11.
select SUM(TongSV) as Tong
from (
    select KH.MaKH, KH.TenKH, COUNT(SV.TenSV) as TongSV 
    from SinhVien SV
    inner join Khoa KH on SV.MaKH = KH.MaKH
    group by KH.MaKH, KH.TenKH
) as Dem;
go

-- 12.
select top 1 KH.TenKH, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, MAX(SV.HocBong) as MAXHocBong
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
group by KH.TenKH, CONCAT(SV.HoSV, ' ', SV.TenSV)
order by MAXHocBong DESC
go

-- 13.
select top 1 SV.MaSV, SV.HoSV, SV.TenSV, KH.TenKH, MAX(SV.HocBong) as MAXHocBong
from SinhVien SV
inner join Khoa KH on SV.MaKH = SV.MaKH
where KH.MaKH like '%TH%'
group by SV.MaSV, SV.HoSV, SV.TenSV, KH.TenKH
order by MAXHocBong DESC
go

-- 14.
select top 1 SV.HoSV, MH.TenMH, MAX(KQ.Diem) as MAXCsdl
from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
inner join SinhVien SV on KQ.MaSV = SV.MaSV
where MH.TenMH like N'Cơ sở dữ liệu'
group by SV.HoSV, MH.TenMH
order by MAXCsdl DESC
go

-- 15.
select top 3 CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH, MH.TenMH, MIN(Diem) as MINDoHoa
from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join MonHoc MH on KQ.MaMH = MH.MaMH
group by CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH, MH.TenMH
order by MINDoHoa ASC
go

-- 16.
select KH.MaKH, KH.TenKH, COUNT(TenSV) as SVNu
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
where SV.Phai = 1
group by KH.MaKH, KH.TenKH
go

-- 17.
select SUM(TongSV) as Tong
from (
    select KH.MaKH, KH.TenKH, COUNT(SV.TenSV) as TongSV
    from SinhVien SV
    inner join Khoa KH on SV.MaKH = KH.MaKH
    group by KH.MaKH, KH.TenKH
) as Dem;
go

select SUM(TongSV) as TongNu
from (
    select KH.MaKH, KH.TenKH, COUNT(SV.TenSV) as TongSV 
    from SinhVien SV
    inner join Khoa KH on SV.MaKH = KH.MaKH
	where SV.Phai = 1
    group by KH.MaKH, KH.TenKH
) as Dem;
go

-- 18.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH,
iif(KQ.Diem>=4, N'Đậu', N'Trượt')
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
go

-- 19.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH, SV.Phai
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
where KQ.Diem >= 4
go

-- 20.
select MH.MaMH, MH.TenMH
from MonHoc MH
inner join Ketqua KQ on MH.MaMH = KQ.MaMH
where KQ.Diem >= 4
group by MH.MaMH, MH.TenMH
go

-- 21.
select KH.MaKH, KH.TenKH, COUNT(SV.TenSV) as Dau
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
where KQ.Diem >= 5
group by KH.MaKH, KH.TenKH
go

-- 22.
select MH.MaMH, MH.TenMH,
SUM(CASE WHEN Diem >= 5 THEN 1 ELSE 0 END) as Dau,
SUM(CASE WHEN diem < 5 THEN 1 ELSE 0 END) as Truot
from Ketqua KQ
inner join MonHoc MH on KQ.MaMH = MH.MaMH
GROUP BY MH.MaMH, MH.TenMH;
go

-- 23.
select MH.MaMH, MH.TenMH, COUNT(KH.TenKH) as NRot
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
where KQ.Diem >= 5
group by MH.MaMH, MH.TenMH
go

-- 24.
select SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.MaKH
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
where KQ.Diem >= 5
group by SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV), KH.MaKH
go

-- 25.
select SV.MaSV, SV.HoSV, SV.TenSV, SV.MaKH
from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = KQ.MaMH 
where KQ.Diem < 5
group by SV.MaSV, SV.HoSV, SV.TenSV, SV.MaKH
having COUNT(MH.MaMH) > 2
go

-- 26.
select KH.MaKH, KH.TenKH, COUNT(MASV) as TongSV
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
group by KH.MaKH, KH.TenKH
having COUNT(SV.MaSV) > 10
go

-- 27
select SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, COUNT(MH.MaMH) as SoMon
from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
group by SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV)
having COUNT(MH.MaMH) > 4
go

-- 28.
select KH.MaKH, KH.TenKH, COUNT(SV.MaSV) as TongSV
from Khoa KH
inner join SinhVien SV on KH.MaKH = SV.MaKH
where SV.Phai = 0
group by KH.MaKH, KH.TenKH
having COUNT(SV.MaSV) >= 5
go

-- 29.
select CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, KH.TenKH, SV.Phai, AVG(KQ.Diem) as DTB
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join Khoa KH on SV.MaKH = KH.MaKH
group by CONCAT(SV.HoSV, ' ', SV.TenSV), KH.TenKH, SV.Phai
having AVG(KQ.Diem) > 4
go

-- 30.
select MH.MaMH, MH.TenMH, AVG(KQ.Diem) as DTB
from Ketqua KQ
inner join MonHoc MH on KQ.MaMH = MH.MaMH
group by MH.MaMH, MH.TenMH
having AVG(KQ.Diem) > 6
go

-- Bài 4
-- 1.
declare @MaKH nvarchar(2)
set @MaKH = 'AV'
select SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, IIF(SV.Phai=1, N'Nam', IIF(SV.Phai=0, N'Nữ', N'NULL')) as GioiTinh, KH.TenKH
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where KH.MaKH = @MaKH
go

-- 2.
declare @Diem float
set @Diem = 3.5
select SV.MaSV, CONCAT(SV.HoSV,' ', SV.TenSV) as HoTen, MH.TenMH, KQ.Diem 
from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
where TenMH = N'Cơ sở dữ liệu' and Diem > @Diem
go

-- 3.
declare @TenMH nvarchar(50)
set @TenMH = N'Cơ sở dữ liệu'
select SV.MaSV, KH.TenKH, MH.TenMH, KQ.Diem 
from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
where TenMH = @TenMH
go

-- Bài 5
-- 1.
select MaSV, MaKH, Phai
from SinhVien
where MaSV not in(
	select MaSV from Ketqua
)
go

-- 2.
-- Cách 1
select MaSV, CONCAT(HoSV, ' ', TenSV) as HoTen
from SinhVien
where MaSV not in (
	select MaSV from Ketqua
	where MaMH in(
		select MaMH from MonHoc
		where TenMH = N'Cơ sở dữ liệu'
	)
)
go
-- Diễn giải
select MaMH from MonHoc where TenMH = N'Cơ sở dữ liệu'
select MaSV from Ketqua where MaMH in(
	select MaMH from MonHoc where TenMH = N'Cơ sở dữ liệu'
)

-- Cách 2
SELECT MaSV,  MaKH,  Phai FROM [dbo].[SinhVien] 
	WHERE MaSV NOT IN (SELECT MaSV FROM [dbo].[Ketqua] KQ
						INNER JOIN [dbo].[MonHoc] MH ON KQ.MaMH = MH.MaMH
						WHERE [TenMH] =N'Cơ sở dữ liệu')
-- diễn giải
SELECT MaSV FROM [dbo].[Ketqua] KQ
						INNER JOIN [dbo].[MonHoc] MH ON KQ.MaMH = MH.MaMH
						WHERE [TenMH] =N'Cơ sở dữ liệu'

-- 3.
select MH.MaMH, MH.TenMH, MH.Sotiet
from MonHoc MH
where MH.MaMH not in(
    select KQ.MaMH FROM Ketqua KQ
)
go

-- 4.
select * from Khoa
where MaKH not in(
	select KH.MaKH from SinhVien SV
	inner join Khoa KH on SV.MaKH = KH.MaKH
)
go

-- 5.
select * from SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH 
where KH.MaKH like '%AV%' and SV.MaSV not in(
	select MaSV from Ketqua KQ
	inner join MonHoc MH on KQ.MaMH = MH.MaMH
	where TenMH = N'Cơ sở dữ liệu'
)
go

-- 6.
SELECT MH.MaMH, MH.TenMH, MH.Sotiet from SinhVien SV
inner join Ketqua KQ on SV.MaSV = KQ.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
inner join Khoa KH on SV.MaKH = KH.MaKH
WHERE KH.TenKH = 'Lý' and MH.MaMH not in(
    SELECT MaMH from KetQua
    WHERE MaSV in (
        SELECT MaSV from SinhVien SV
		inner join Khoa KH on SV.MaKH = KH.MaKH
        where TenKH = 'Lý'
    )
)
go

-- 7.
select * from SinhVien SV
inner join KetQua KQ on SV.MaSV = KQ.MaSV
WHERE MaMH = 'Đồ họa' and Diem < (
    select MIN(Diem) from KetQua KQ
    inner join SinhVien SV on KQ.MaSV = SV.MaSV
	inner join MonHoc MH on KQ.MaMH = MH.MaMH
    where SV.MaKH = '%TH%' and MH.TenMH = 'Đồ họa'
)
go

-- 8.
select * from SinhVien
where NgaySinh >(
	select MIN(NgaySinh) from SinhVien
	where MaKH like '%AV%'
)
go

-- 9.
select * from SinhVien
where HocBong >(
	select MAX(HocBong) from SinhVien SV
	inner join Khoa KH on SV.MaKH = KH.MaKH
	where TenKH = N'Triết'
)  order by HocBong DESC
go

-- 10
select * from SinhVien
where NoiSinh = (
    select SV.NoiSinh from SinhVien SV
    inner join Khoa KH ON SV.MaKH = KH.MaKH
    where KH.TenKH = 'Lý'
	order by HocBong DESC
)
go

-- 11
select SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV) as HoTen, MH.TenMH, KQ.Diem
from Ketqua KQ
inner join SinhVien SV on KQ.MaSV = SV.MaSV
inner join MonHoc MH on KQ.MaMH = MH.MaMH
where KQ.Diem in(
	select MAX(KQ.Diem) from Ketqua KQ
	inner join MonHoc MH on KQ.MaMH = MH.MaMH
	group by MH.MaMH
)
group by SV.MaSV, CONCAT(SV.HoSV, ' ', SV.TenSV), MH.TenMH, KQ.Diem
go

-- 12.
SELECT SV.MaSV, KH.TenKH, SV.HocBong
FROM SinhVien SV
inner join Khoa KH on SV.MaKH = KH.MaKH
where SV.HocBong in (
    select MAX(SV.HocBong) as MaxHB from SinhVien SV
    inner join Khoa KH on SV.MaKH = KH.MaKH
    GROUP BY KH.TenKH
)
go

-- Bài 6
-- 1.
insert into SinhVien(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong) values
(N'C02', N'Lê Thành', N'Nguyên', 0, N'1980/10/20', N'Thành phố Hồ Chí Minh', N'TH', 850000)
select * from SinhVien
go

-- 2.
insert into MonHoc(MaMH, TenMH, Sotiet) values
(N'10', N'Xử lí ảnh', 45)
select * from MonHoc
go

-- 3.
insert into Khoa(MaKH, TenKH) values
(N'CT', N'Công trình')
select * from Khoa
go

-- 4.
insert into SinhVien(MaSV, HoSV, TenSV, Phai, NgaySinh, NoiSinh, MaKH, HocBong) values
(N'C04', N'Nguyễn Trần', N'Quân', 0, GETDATE(), N'Huế', N'CT', 950000)
select * from SinhVien
go

-- 5.
