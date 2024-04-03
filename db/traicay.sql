-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2023 at 10:11 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traicay`
--

-- --------------------------------------------------------

--
-- Table structure for table `adm`
--

CREATE TABLE `adm` (
  `ma_adm` int(11) NOT NULL,
  `ten_dn` varchar(30) NOT NULL,
  `level` int(10) NOT NULL,
  `mat_khau` varchar(30) NOT NULL,
  `ho` varchar(30) NOT NULL,
  `ten` varchar(30) NOT NULL,
  `gioi_tinh` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `adm`
--

INSERT INTO `adm` (`ma_adm`, `ten_dn`, `level`, `mat_khau`, `ho`, `ten`, `gioi_tinh`) VALUES
(1, 'admin', 1, 'admin', 'Tạ Nguyễn', 'Thanh Nhân', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ct_dondathang`
--

CREATE TABLE `ct_dondathang` (
  `ma_dh` int(10) NOT NULL,
  `ma_qua` varchar(10) NOT NULL,
  `gia_ban` float NOT NULL,
  `sl_dat` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ct_dondathang`
--

INSERT INTO `ct_dondathang` (`ma_dh`, `ma_qua`, `gia_ban`, `sl_dat`) VALUES
(105, '50', 15000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `ma_dh` int(10) NOT NULL,
  `ma_kh` int(11) NOT NULL,
  `ngay_dh` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ngay_gh` varchar(10) NOT NULL,
  `noi_giao` varchar(300) NOT NULL,
  `hien_trang` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`ma_dh`, `ma_kh`, `ngay_dh`, `ngay_gh`, `noi_giao`, `hien_trang`) VALUES
(105, 48, '2023-05-14 18:23:29', '2023-05-18', ' trần cao phù cừ hưng yên', 0);

-- --------------------------------------------------------

--
-- Table structure for table `khach_hang`
--

CREATE TABLE `khach_hang` (
  `ma_kh` int(11) NOT NULL,
  `ho_kh` varchar(30) NOT NULL,
  `ten_kh` varchar(30) NOT NULL,
  `sdt` int(11) NOT NULL,
  `dia_chi` varchar(200) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gioi_tinh` int(11) NOT NULL DEFAULT 0,
  `ten_dn` varchar(15) NOT NULL,
  `mat_khau` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `khach_hang`
--

INSERT INTO `khach_hang` (`ma_kh`, `ho_kh`, `ten_kh`, `sdt`, `dia_chi`, `email`, `gioi_tinh`, `ten_dn`, `mat_khau`) VALUES
(48, 'thanh', 'nhân', 866096164, ' trần cao phù cừ hưng yên', 'aileennnn310@gmail.com', 2, 'duykhoi', '3615358'),
(46, 'tạ nguyễn', 'thanh nhân', 789251223, 'Phù Cừ - Hưng Yên', 'khoikingme@gmail.com', 3, 'nhanta', '3615358');

-- --------------------------------------------------------

--
-- Table structure for table `lien_he`
--

CREATE TABLE `lien_he` (
  `ma_lh` int(11) NOT NULL,
  `ten_nguoi_lh` varchar(40) NOT NULL,
  `sdt_nguoi_lh` varchar(12) NOT NULL,
  `email_nguoi_lh` varchar(50) NOT NULL,
  `gioi_nguoi_lh` int(11) NOT NULL,
  `diachi_nguoi_lh` varchar(200) NOT NULL,
  `noi_dung` varchar(1000) NOT NULL,
  `ngay_lh` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `lien_he`
--

INSERT INTO `lien_he` (`ma_lh`, `ten_nguoi_lh`, `sdt_nguoi_lh`, `email_nguoi_lh`, `gioi_nguoi_lh`, `diachi_nguoi_lh`, `noi_dung`, `ngay_lh`) VALUES
(17, 'hi', '1234567898', 'khoikingme@gmail.com', 2, 'huyng', 'uòtxyi', '2023-05-12 20:16:27');

-- --------------------------------------------------------

--
-- Table structure for table `loai_qua`
--

CREATE TABLE `loai_qua` (
  `ma_loai` int(11) NOT NULL,
  `ten_loai` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `loai_qua`
--

INSERT INTO `loai_qua` (`ma_loai`, `ten_loai`) VALUES
(1, 'Quả Miền Bắc'),
(2, 'Quả Miền Trung'),
(3, 'Quả Miền Nam'),
(4, 'Hoa Quả Đặc Sản Hưng Yên'),
(5, 'Hoa Quả Nhập Khẩu'),
(42, 'Hoa Quả Đặc Sản Mộc Châu');

-- --------------------------------------------------------

--
-- Table structure for table `qua`
--

CREATE TABLE `qua` (
  `ma_qua` int(11) NOT NULL,
  `ma_loai` int(11) NOT NULL,
  `ten_qua` varchar(30) NOT NULL,
  `gia` float NOT NULL,
  `hinh_anh` varchar(100) NOT NULL,
  `mo_ta` varchar(300) NOT NULL,
  `ngay_d` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `trang_thai` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `qua`
--

INSERT INTO `qua` (`ma_qua`, `ma_loai`, `ten_qua`, `gia`, `hinh_anh`, `mo_ta`, `ngay_d`, `trang_thai`) VALUES
(46, 3, '1 ký Mãng Cầu Xiêm', 45000, 'mangcau.jpg', 'Ở nước ta mãng cầu xiêm chỉ trồng nhiều ở miền Nam, ra tới phía bắc Nha Trang thì ít gặp. Do đó, càng không thể trồng mãng cầu xiêm ở miền Bắc, đặc biệt là những tỉnh giữa miền Bắc như Vĩnh Phúc. – Độ pH thích hợp cho cây là từ 5,0 – 6,5', '2023-05-13 21:17:42', 0),
(47, 42, '1 ký bơ sáp Mộc Châu ', 90000, 'Bơ Sáp.jpg', 'Bơ sáp Mộc Châu - Thứ quả giàu dinh dưỡng trên cao nguyên', '2023-05-13 21:16:07', 1),
(48, 4, '1 ký Nhãn lồng', 10000, 'nhanlonghungyen.jpg', 'Nhãn chín có màu vàng sậm, cho vị ngọt, thơm, cho quả to, cùi dày, năng suất cao', '2023-05-13 21:21:40', 1),
(45, 3, '0.5 ký Măng Cụt Bình Dương', 65000, 'Măng cụt 1.JPG', 'Măng cụt hay còn được gọi là quả tỏi ngọt, là một loài cây thuộc họ Bứa. Nó cũng là loại cây nhiệt đới thường xanh cho quả ăn được, có nguồn gốc từ các đảo quốc Đông Nam Á. Nguồn gốc của nó là không chắc chắn do việc trồng trọt thời tiền sử rộng rãi.', '2023-05-13 21:18:01', 0),
(43, 3, '1 ký Xoài Cát Hòa Lộc', 40000, 'xoài cát hòa lộc.jpg', 'Xoài cát Hòa Lộc là loại xoài đặc sản nổi tiếng của vùng đất Định Tường, một trong những loại trái cây chủ lực của Tiền Giang. Xoài cát Hòa Lộc là loại trái cây đặc sản của tỉnh Tiền Giang, và là sản phẩm trái cây đầu tiên được cấp bảo hộ chỉ dẫn địa lý', '2023-05-13 21:18:24', 0),
(44, 1, '1 ký Ổi Thanh Hà ', 10000, 'ổi thanh hà.jpg', 'Ổi Thanh Hà được trồng trên địa bàn huyện Thanh Hà, tỉnh Hải Dương, Việt Nam. Nhờ điều kiện thổ nhưỡng, khí hậu phù hợp, ổi Thanh Hà đã trở thành đặc sản, cho hiệu quả kinh tế cao nhất trong nhóm cây ăn quả.', '2023-05-13 21:18:10', 0),
(49, 1, 'Nho Ninh Thuận', 160000, 'tải xuống.jpg', 'Nho đỏ Ninh thuận có dạng hình cầu, vỏ quả bóng, rất mỏng, quả chín có màu đỏ tươi đến đỏ đậm, có vị ngọt hài hoà với vị chua nhẹ', '2023-05-13 21:24:10', 1),
(50, 1, 'Vải Lục Ngạn', 15000, 'Vải Thiều.jpg', 'Vải Lục Ngạn đầu mùa siêu ngọt, mọng nước', '2023-05-13 21:24:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tin_tuc`
--

CREATE TABLE `tin_tuc` (
  `ma_tt` int(11) NOT NULL,
  `tieu_de` varchar(50) NOT NULL,
  `hinh_anh` varchar(100) NOT NULL,
  `noi_dung` varchar(10000) NOT NULL,
  `ngay_dang` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tin_tuc`
--

INSERT INTO `tin_tuc` (`ma_tt`, `tieu_de`, `hinh_anh`, `noi_dung`, `ngay_dang`) VALUES
(46, '10 công dụng của nước dừa.', '1649659749-159008374d444bbeb08b825f0cdb755e-width645height430.jpg', '<div>Nước dừa là một nguồn tài nguyên tự nhiên phong phú và rất hữu ích cho sức khỏe con người. Dưới đây là 10 công dụng của nước dừa:</div><div><br></div><div>1. Cung cấp năng lượng: Nước dừa là một nguồn năng lượng tự nhiên và cung cấp đường cho cơ thể.&nbsp;</div><div><br></div><div>2. Tăng cường miễn dịch: Nước dừa có chứa axit lauric, là một chất kháng khuẩn và kháng viêm, giúp tăng cường hệ miễn dịch của cơ thể.</div><div><br></div><div>3. Tăng cường trí nhớ: Các chất chống oxy hóa trong nước dừa giúp tăng cường chức năng não và tăng cường trí nhớ.</div><div><br></div><div>4. Tăng cường sức khỏe tim mạch: Nước dừa giúp giảm mức đường huyết, giảm huyết áp và tăng cường chức năng tim mạch.</div><div><br></div><div>5. Giảm căng thẳng: Nước dừa có tác dụng làm dịu và giảm căng thẳng, đặc biệt là trong thời gian mùa hè.</div><div><br></div><div>6. Tăng cường sức mạnh xương: Nước dừa có chứa nhiều khoáng chất bao gồm canxi, magie và phốt pho, giúp tăng cường sức mạnh xương.</div><div><br></div><div>7. Tăng cường hệ tiêu hóa: Nước dừa giúp cải thiện sức khỏe đường ruột bằng cách cân bằng vi khuẩn đường ruột.</div><div><br></div><div>8. Chống lão hóa: Nước dừa chứa nhiều chất chống oxy hóa, giúp ngăn ngừa quá trình lão hóa và giữ cho da tươi trẻ.</div><div><br></div><div>9. Giảm đau khớp: Nước dừa có tác dụng làm giảm đau khớp và viêm khớp.</div><div><br></div><div>10. Chống ung thư: Nhiều nghiên cứu đã cho thấy rằng nước dừa có thể giúp ngăn ngừa và điều trị ung thư, đặc biệt là ung thư đại trực tràng và ung thư vú.</div>', '2023-05-13 04:58:35'),
(45, 'Nhãn lồng Hưng Yên  món quà tinh túy của trời đất.', 'nhan-long.jpg', '<p style=\"text-align:justify;line-height:12.5pt;background:white\">Từ lâu, nhãn\r\nlồng đã trở thành một đặc sản nổi tiếng của đất Hưng Yên. Cây nhãn đã bám sâu\r\nvào đời sống người dân Hưng Yên, không chỉ là sản vật biểu tượng cho những tinh\r\ntúy của vùng đất này mà còn là một loại cây mang lại giá trị kinh tế cao, cải\r\nthiện đời sống của bà con nông dân.</p>\r\n\r\n<p style=\"text-align:justify;line-height:12.5pt;background:white\">Nhãn lồng\r\nđược trồng nhiều dọc triền đê sông Hồng, sông Luộc… Hằng năm, cứ vào tháng sáu\r\nâm lịch là nhãn lồng bắt đầu chín rộ, nhuộm vàng cả một góc trời, những quả\r\nnhãn to tròn, căng mọng. Nhãn lồng của Hưng Yên khác hẳn với những loại nhãn ở\r\ncác vùng khác, đó là nhãn khi chín có màu nâu sẫm, vỏ mỏng. Bóc một lớp vỏ mỏng\r\nbên ngoài, bên trong là lớp cùi nhẵn dày, các lớp cùi xếp lồng vào nhau căng\r\nmọng, ăn giòn, ngọt đậm và thơm dịu mát. Mùi thơm của nhãn lồng Hưng Yên rất\r\nđặc trưng, hương thơm tinh khiết, dịu mát tỏa nhẹ làm ngây ngất lòng người.\r\nNhãn lồng Hưng Yên có hương vị riêng biệt mà không loại nhãn nào sánh được, ăn\r\nvừa ngọt vừa thơm. Quả không sai khi thưởng thức nhãn lồng Hưng Yên, nhà bác\r\nhọc Lê Quý Đôn đã phải thốt lên rằng: “Mỗi lần bỏ vào miệng thì tận trong răng\r\nlưỡi đã nảy ra vị thơm tựa như nước thánh trời cho”.</p>\r\n\r\n<p style=\"text-align:justify;line-height:12.5pt;background:white\">Mảnh đất Hưng\r\nYên nhờ thứ đặc sản này mà đã khẳng định được tên tuổi, thương hiệu của mình\r\nkhắp nơi và nhãn lồng đã vươn ra thị trường thế giới. Nhãn lồng sấy khô, dẻo\r\nquánh, có màu nâu sậm, vẫn còn nguyên hương thơm và có vị ngọt hơn đường phèn,\r\ngọi là long nhãn, đã xuất khẩu sang thị trường nước ngoài và rất được ưa\r\nchuộng. Nhãn lồng còn là một thứ thuốc quý dân gian của bà con. Người ta thường\r\nlấy long nhãn ngâm rượu để uống giúp cho tinh thần sảng khoái, ăn ngon và ngủ\r\nsâu hoặc lấy long nhãn bỏ hột lồng với hạt sen bên trong hấp chín, rồi ngâm với\r\nđường, là một món ngon giàu chất dinh dưỡng và để giải khát khi trời nóng, giải\r\nnhiệt cơ thể rất tốt. Nhãn lồng Hưng Yên luôn là một món quà quý, để người đi\r\nxa luôn phải ngóng chờ mỗi mùa nhãn đến. Ca dao xưa đã có câu:</p>\r\n\r\n<p style=\"text-align:justify;line-height:12.5pt;background:white\"><em>\"Dù đi\r\nbuôn Bắc bán Đông</em></p>\r\n\r\n<p style=\"text-align:justify;line-height:12.5pt;background:white\"><em>Đố ai\r\nquên được nhãn lồng Hưng Yên.\"</em></p>', '2023-05-13 04:57:01'),
(55, 'Cam Vinh và công dụng thần kỳ của vitamin C', 'camvinh.jpg', '<div>Cam Vinh là một loại trái cây giàu vitamin C, một chất dinh dưỡng cần thiết cho sức khỏe của con người. Dưới đây là một số công dụng của vitamin C trong Cam Vinh:</div><div><br></div><div>1. Hỗ trợ hệ miễn dịch: Vitamin C giúp tăng cường hệ miễn dịch của cơ thể bằng cách kích thích sản xuất các tế bào miễn dịch và tăng cường khả năng phản ứng với các vi khuẩn, virus và các tác nhân gây bệnh khác.</div><div><br></div><div>2. Giảm nguy cơ bệnh tật: Vitamin C có khả năng chống oxy hóa và giảm tổn thương tế bào, làm giảm nguy cơ bệnh tim, ung thư và các bệnh khác.</div><div><br></div><div>3. Tăng cường hấp thu sắt: Vitamin C giúp cơ thể hấp thu sắt từ thực phẩm, giúp ngăn ngừa thiếu máu.</div><div><br></div><div>4. Hỗ trợ quá trình tái tạo tế bào: Vitamin C là một thành phần quan trọng trong việc sản xuất collagen, một loại protein quan trọng cho tế bào và các mô của cơ thể.</div><div><br></div><div>5. Tăng cường khả năng hấp thu canxi: Vitamin C giúp tăng cường khả năng hấp thu canxi trong cơ thể, giúp bảo vệ xương và răng khỏi các vấn đề về sức khỏe.</div><div><br></div><div>Tóm lại, vitamin C trong Cam Vinh có nhiều công dụng cho sức khỏe của con người, và là một trong những lý do tại sao Cam Vinh được coi là một loại trái cây rất tốt cho sức khỏe.</div>', '2023-05-13 05:09:50'),
(56, 'Công dụng thần kỳ của trái ổi', 'oidailoan.jpg', '<div>Quả ổi là một loại trái cây giàu chất dinh dưỡng và có nhiều lợi ích cho sức khỏe con người. Dưới đây là một số công dụng của quả ổi:</div><div><br></div><div>1. Cung cấp nhiều chất dinh dưỡng: Quả ổi chứa nhiều chất dinh dưỡng như vitamin C, vitamin A, kali, canxi, sắt và chất xơ.</div><div><br></div><div>2. Giảm nguy cơ bệnh tật: Quả ổi chứa nhiều chất chống oxy hóa và các hợp chất có tính chất chống viêm, giúp giảm nguy cơ mắc các bệnh như ung thư, bệnh tim và tiểu đường.</div><div><br></div><div>3. Hỗ trợ hệ tiêu hóa: Quả ổi chứa nhiều chất xơ, giúp tăng cường sức khỏe đường ruột và giảm nguy cơ mắc các bệnh về tiêu hóa.</div><div><br></div><div>4. Tốt cho sức khỏe tim mạch: Quả ổi có khả năng giảm mức đường huyết và cholesterol trong máu, giúp bảo vệ sức khỏe tim mạch.</div><div><br></div><div>5. Tăng cường sức khỏe cho tóc và da: Quả ổi là nguồn cung cấp chất chống oxy hóa và vitamin C, giúp tóc và da khỏe mạnh.</div><div><br></div><div>6. Hỗ trợ sức khỏe tuyến giáp: Quả ổi chứa một lượng lớn iodine, một chất dinh dưỡng cần thiết cho sức khỏe tuyến giáp.</div><div><br></div><div>Tóm lại, quả ổi là một loại trái cây giàu chất dinh dưỡng và có nhiều lợi ích cho sức khỏe. Nó có thể được sử dụng trong chế độ ăn uống để bổ sung các chất dinh dưỡng và giảm nguy cơ mắc các bệnh tật.</div>', '2023-05-13 05:11:13'),
(54, 'Cam Vinh vào vụ giá chỉ 11000 đồng?', 'avatar1636331179147-16363311797451220486-1636340387433-16363403889141812629304.jpg', '<div>Lý do Cam Vinh được giá thấp đến mức chỉ có 11.000 đồng/kg có thể do nhiều yếu tố khác nhau, bao gồm:</div><div><br></div><div>1. Thời điểm thu hoạch: Cam Vinh có thể được thu hoạch vào mùa đông hoặc mùa xuân. Thời điểm thu hoạch khác nhau có thể ảnh hưởng đến giá của sản phẩm.</div><div><br></div><div>2. Sản lượng: Nếu sản lượng Cam Vinh quá cao thì giá cả sẽ giảm do cạnh tranh giữa các nhà sản xuất và người bán.</div><div><br></div><div>3. Chất lượng: Nếu chất lượng của Cam Vinh không đạt yêu cầu thì giá cả cũng sẽ bị ảnh hưởng.</div><div><br></div><div>4. Cạnh tranh từ các loại trái cây khác: Trong thời điểm Cam Vinh được thu hoạch, có thể có sự cạnh tranh từ các loại trái cây khác, làm giảm giá của sản phẩm.</div><div><br></div><div>Vì vậy, các yếu tố này có thể đóng vai trò quan trọng trong việc quyết định giá của Cam Vinh. Tuy nhiên, việc giá Cam Vinh chỉ có 11.000 đồng/kg hay không còn phụ thuộc vào nhiều yếu tố khác như chi phí vận chuyển, địa điểm bán hàng, sự khan hiếm của sản phẩm và sự thịnh hành của nó trong thị trường.</div>', '2023-05-13 05:08:15'),
(51, 'Mở cơ hợi mới cho cam Vinh', 'bna_cam_vinh_vau_vu_anh_xuan_hoang2327050_312022.jpg', '<div>Lý do mở cơ hội mới cho Cam Vinh có thể do nhiều yếu tố, tùy thuộc vào ngữ cảnh và quyết định của các bên liên quan. Tuy nhiên, đây là một số lý do phổ biến:</div><div><br></div><div>1. Tiềm năng tăng trưởng: Cam Vinh có thể được xem là một doanh nghiệp có tiềm năng tăng trưởng và đang phát triển trong lĩnh vực kinh doanh của mình. Do đó, việc mở cơ hội mới cho Cam Vinh sẽ giúp cho doanh nghiệp này tiếp tục phát triển và tăng cường vị thế của mình trong thị trường.</div><div><br></div><div>2. Cơ hội đầu tư: Việc mở cơ hội mới cho Cam Vinh cũng có thể đem lại cơ hội đầu tư hấp dẫn cho các nhà đầu tư. Điều này có thể thu hút sự quan tâm từ các nhà đầu tư và giúp Cam Vinh thu được nguồn vốn để phát triển kinh doanh.</div><div><br></div><div>3. Thúc đẩy phát triển kinh tế địa phương: Cam Vinh có thể là một nhà sản xuất hoặc nhà cung cấp hàng hóa và dịch vụ cho các doanh nghiệp khác trong khu vực. Việc mở cơ hội mới cho Cam Vinh sẽ giúp thúc đẩy phát triển kinh tế địa phương và tạo ra việc làm cho người dân địa phương.</div><div><br></div><div>Tuy nhiên, quyết định mở cơ hội mới cho Cam Vinh sẽ phụ thuộc vào nhiều yếu tố khác nhau, chẳng hạn như điều kiện kinh tế, chính sách của chính phủ, cạnh tranh trong thị trường và nhiều yếu tố khác.</div>', '2023-05-13 05:03:23'),
(52, 'Cách chọn bưởi ngon', 'buoidien.jpg', '<div>Đây là một số cách chọn bưởi ngon:</div><div>1. Chọn bưởi càng nặng càng tốt: Bưởi nặng hơn thường có nhiều nước hơn và hương vị thường ngọt hơn.</div><div><br></div><div>2. Chọn bưởi có vỏ bóng, mịn: Vỏ bưởi mịn và bóng thường là dấu hiệu của một quả bưởi tươi mới.</div><div><br></div><div>3. Chọn bưởi có vị chua ngọt cân đối: Nếu quả bưởi quá chua hoặc quá ngọt, có thể chỉ ra rằng nó không chín đều.</div><div><br></div><div>4. Chọn bưởi có màu sắc đẹp: Bưởi chín sẽ có màu sắc đẹp, tươi sáng và đều màu. Nếu bưởi có các vết bỏng hoặc trái lõm thì nên tránh.</div><div><br></div><div>5. Chọn bưởi không có vết bong tróc: Vỏ bưởi không nên có các vết bong tróc, vết thâm hoặc trái bị thối.</div><div><br></div><div>6. Nên chọn bưởi tươi mới: Nếu có thể, nên chọn bưởi tươi mới từ cây bưởi và tránh các quả bưởi bị lâu ngày trong kho hàng.</div><div><br></div><div>7. Kiểm tra độ chín của bưởi: Kiểm tra độ chín của bưởi bằng cách nhấn nhẹ vào phần thân của quả bưởi. Nếu thấy phần đó mềm thì có nghĩa là bưởi đã chín.</div><div><br></div><div>Những cách chọn bưởi ngon này có thể giúp bạn chọn được những quả bưởi tươi ngon, giàu dinh dưỡng và hương vị thơm ngon.</div>', '2023-05-13 05:05:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adm`
--
ALTER TABLE `adm`
  ADD PRIMARY KEY (`ma_adm`),
  ADD UNIQUE KEY `ten_dn` (`ten_dn`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`ma_dh`);

--
-- Indexes for table `khach_hang`
--
ALTER TABLE `khach_hang`
  ADD PRIMARY KEY (`ma_kh`),
  ADD UNIQUE KEY `ten_dn` (`ten_dn`);

--
-- Indexes for table `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`ma_lh`);

--
-- Indexes for table `loai_qua`
--
ALTER TABLE `loai_qua`
  ADD PRIMARY KEY (`ma_loai`);

--
-- Indexes for table `qua`
--
ALTER TABLE `qua`
  ADD PRIMARY KEY (`ma_qua`);

--
-- Indexes for table `tin_tuc`
--
ALTER TABLE `tin_tuc`
  ADD PRIMARY KEY (`ma_tt`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adm`
--
ALTER TABLE `adm`
  MODIFY `ma_adm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `dondathang`
--
ALTER TABLE `dondathang`
  MODIFY `ma_dh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `khach_hang`
--
ALTER TABLE `khach_hang`
  MODIFY `ma_kh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `ma_lh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `loai_qua`
--
ALTER TABLE `loai_qua`
  MODIFY `ma_loai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `qua`
--
ALTER TABLE `qua`
  MODIFY `ma_qua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tin_tuc`
--
ALTER TABLE `tin_tuc`
  MODIFY `ma_tt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
