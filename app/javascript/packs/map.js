// ブートストラップ ローダ
(g=>{var h,a,k,p="The Google Maps JavaScript API",c="google",l="importLibrary",q="__ib__",m=document,b=window;b=b[c]||(b[c]={});var d=b.maps||(b.maps={}),r=new Set,e=new URLSearchParams,u=()=>h||(h=new Promise(async(f,n)=>{await (a=m.createElement("script"));e.set("libraries",[...r]+"");for(k in g)e.set(k.replace(/[A-Z]/g,t=>"_"+t[0].toLowerCase()),g[k]);e.set("callback",c+".maps."+q);a.src=`https://maps.${c}apis.com/maps/api/js?`+e;d[q]=f;a.onerror=()=>h=n(Error(p+" could not load."));a.nonce=m.querySelector("script[nonce]")?.nonce||"";m.head.append(a)}));d[l]?console.warn(p+" only loads once. Ignoring:",g):d[l]=(f,...n)=>r.add(f)&&u().then(()=>d[l](f,...n))})({
  key: process.env.Maps_Javascript_API 
});

// ライブラリの読み込み
let map;

async function initMap() {
  const { Map } = await google.maps.importLibrary("maps");
  const {AdvancedMarkerElement} = await google.maps.importLibrary("marker");
  const no_image_path = document.getElementById("store_image").src;

  map = new Map(document.getElementById("map"), {
    center: { lat: 35.681236, lng: 139.767125 },
    zoom: 15,
    mapId: "AIzaSyCGdP0fBqP9q_PZ4lzZ6yAGsFmhcmD3Kyo", 
    mapTypeControl: false
  });

  try {
    const response = await fetch("/stores.json");
    if (!response.ok) throw new Error('Network response was not ok');

    const { data: { items } } = await response.json();
    if (!Array.isArray(items)) throw new Error("Items is not an array");
    items.forEach( item => {
      const latitude = item.latitude;
      const longitude = item.longitude;
      const storeName = item.store_name;
      let storeImage = "";
      if (item.store_image != "") {
        storeImage = item.store_image;
      } else {
        storeImage = no_image_path;
      }
      const phoneNumber = item.phone_number;
      const address = item.address;
      const storeUrl = item.store_url;
      const storeInfo = item.store_info;
      const storeId = item.store_id;

      const marker = new google.maps.marker.AdvancedMarkerElement ({
        position: { lat: latitude, lng: longitude },
        map,
        title: storeName,
      });

      const contentString = `
        <div class="information container p-0">
          <div>
            <img class="mb-3 d-flex align-items-center" src="${storeImage}" width="100" height="100"> 
          </div>
          <div>
            <p class="lead m-0 font-weight-bold">${storeName}</p>
            <p class="text-muted">${address}</p>
          </div>
        </div>
      `;
      
      const infowindow = new google.maps.InfoWindow({
        content: contentString,
        ariaLabel: storeName,
      });

      marker.addListener("click", () => {
          const storeIdEle = document.getElementById('store_id')
          const storeImageEle = document.getElementById('store_image')
          const storeNameEle = document.getElementById('store_name')
          const phoneNumberEle = document.getElementById('phone_number')
          const addressNameEle = document.getElementById('address')
          const storeUrlEle = document.getElementById('store_url')
          const storeInfoEle = document.getElementById('store_info')
          
          storeIdEle.href = `/stores/${storeId}`
          storeImageEle.src = storeImage
          storeNameEle.innerHTML = storeName
          phoneNumberEle.innerHTML = phoneNumber
          addressNameEle.innerHTML = address
          storeUrlEle.innerHTML = storeUrl
          storeInfoEle.innerHTML = storeInfo

          infowindow.open({
          anchor: marker,
          map,
        })
      });
    });
  } catch (error) {
    console.error('Error fetching or post images:', error);
  }
  window.getPosition =function() {
    // 現在地を取得
    navigator.geolocation.getCurrentPosition(
      // 取得成功した場合
      function(position) {
        // 緯度・経度を変数に格納
        var mapLatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
        map.setCenter(mapLatLng);
        //　マップにマーカーを表示する
        var marker = new google.maps.Marker({
          map : map,             // 対象の地図オブジェクト
          position : mapLatLng   // 緯度・経度
        });
      },
      // 取得失敗した場合
      function(error) {
        // エラーメッセージを表示
        switch(error.code) {
          case 1: // PERMISSION_DENIED
            alert("位置情報の利用が許可されていません");
            break;
          case 2: // POSITION_UNAVAILABLE
            alert("現在位置が取得できませんでした");
            break;
          case 3: // TIMEOUT
            alert("タイムアウトになりました");
            break;
          default:
            alert("その他のエラー(エラーコード:"+error.code+")");
            break;
        }
      }
    );
  }
}

initMap()
  // Geolocation APIに対応している
  if (navigator.geolocation) {
    alert("この端末では位置情報が取得できます");
  // Geolocation APIに対応していない
  } else {
    alert("この端末では位置情報が取得できません");
  }
  