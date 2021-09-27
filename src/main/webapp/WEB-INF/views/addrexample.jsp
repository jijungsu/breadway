<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>�ּҷ� ��� ǥ���ϱ�</title>
     <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>
</head>
<body>
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5acc7ee5ef93f6db9b99b45f7fd217dd&libraries=services"></script>
	
	<script type="text/javascript">
		var inputData = ['${theatre.theatre_Name}']
		//������ �߽���ǥ
		var mapContainer = document.getElementById('map'),
			mapOption = {
				center: new kakao.maps.LatLng(37.54699, 127.09598),
				level: 3 //Ȯ�뷹��
				};
		//���� ����
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var count = 0;
		var ps = new kakao.maps.services.Places();
		var bounds = new kakao.maps.LatLngBounds();
		if (inputData != null) {
			kewwordSearch(inputData[count]);
			}
		
		function kewwordSearch(keword) {
			ps.keywordSearch(keword, placesSearchCB);
			count = count + 1;
			}
		
		function placesSearchCB(data, status, pagination) {
				if (status === kakao.maps.services.Status.OK) {
						displayMarker(data[0]);
						bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
				if (count < inputData.length) {
					kewwordSearch(inputData[count]);
				} else if (count == inputData.length) {
					setBounds();
				}
			}
		}
		//������ ��Ŀ�� ǥ��
		function displayMarker(place) {
			var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x),
		});
			// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
			// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
			// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title">' + 
			            '           ${theatre.theatre_Name}' + 
			            '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis">${theatre.theatre_Address}</div>' + 
			            '					<div><a href="${theatre.theatre_webAddr}" target="_blank" class="link">Ȩ������</a></div>'+
			          /*   '                <div class="jibun ellipsis">(��) 08209 (����) �ŵ����� 692</div>' + 
			            '                +  */
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';

			// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
			// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});

			// ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
			kakao.maps.event.addListener(marker, 'click', function() {
				var position = this.getPosition();
				var url = 'https://map.kakao.com/link/map/' + place.id;
				window.open(url, '_blank');
			    overlay.setMap(map);
			});

			// Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
			function closeOverlay() {
			    overlay.setMap(null);     
			}	
		}
	function setBounds() {
	map.setBounds(bounds, 90, 30, 10, 30);
	}
	</script>
</body>
</html>