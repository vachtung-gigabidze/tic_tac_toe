'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"icons/Icon-maskable-192.png": "f931d212b3bb9bb93af8c897a74a97bb",
"icons/Icon-512.png": "978493b4207ec89698590bad576e9375",
"icons/Icon-192.png": "f931d212b3bb9bb93af8c897a74a97bb",
"icons/Icon-maskable-512.png": "978493b4207ec89698590bad576e9375",
"version.json": "a9545f40dfa73ffcdff9b15f37549e78",
"flutter_bootstrap.js": "c5f6cc60c1de711a7ebe59c0383a72b2",
"manifest.json": "46386eb53152653821300ebf740c68fb",
"main.dart.js": "087d2707bb85d72850f3638869f3c099",
"CNAME": "1a5ff8a819d7cb9d7b77957c619aa573",
"index.html": "3adf943e25eebba045f7d8078b7fb756",
"/": "3adf943e25eebba045f7d8078b7fb756",
"assets/AssetManifest.json": "85435f803800a3644f353fd3c7011f4b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "f2754ad4280b6c2c61886c4bb498e026",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "3020802906dc520f88ca973c65aa46d8",
"assets/AssetManifest.bin.json": "4aad1e84c5fedda2109abf7327af690a",
"assets/NOTICES": "84e14e8a3e1b18e153b1d126741027b6",
"assets/assets/songs/neighbour.mp3": "221753b6f99982d484de922ee12e4a77",
"assets/assets/songs/donkey.mp3": "e49b313c0e48b9e84d5f44ba78bda184",
"assets/assets/songs/country.mp3": "3d74cf3e983b9305084cc77736e0ad7d",
"assets/assets/sounds/move.mp3": "d940c31eff183c45537a03dc011cd822",
"assets/assets/sounds/draw.mp3": "71d180bcd82246170eb11154b075bffe",
"assets/assets/sounds/win.mp3": "5e2354fe9605b4438f79b12901a24345",
"assets/assets/sounds/loose.mp3": "8e976a2c1a15ca3973db80fc01b1921a",
"assets/assets/images/lose.png": "ea97f3f7440d603225069912b6ba81ca",
"assets/assets/images/single_player_icon.png": "7b8645768256e75e7858e6f772fba2bf",
"assets/assets/images/x_2.png": "f1844fb19343ba8819a8e722fc453262",
"assets/assets/images/question_icon.png": "efe92bfb275c10d017f7d3303062fbf2",
"assets/assets/images/setting_icon.png": "a954d47a0831d60eb1b0b03f9893c6a5",
"assets/assets/images/o_7.png": "400025b66dd5ea8a8504d6aa4ea99134",
"assets/assets/images/o_5.png": "94b7661171d96259b58ab2ff0cea743c",
"assets/assets/images/o_3.png": "3da74bd218ec87d77c09b3f955512167",
"assets/assets/images/o_2.png": "cc3614cb26c18b63ff60e3a86e466f48",
"assets/assets/images/win.png": "8b3a88722636384d4a7cf391dc72d92e",
"assets/assets/images/o_8.png": "4dce42a409b5f35c910566cf92242e42",
"assets/assets/images/robot.png": "1ffa909fe4044bb5900c33360580d8c8",
"assets/assets/images/XO.png": "5b3bb3661c9a91a01254368a00b8cf06",
"assets/assets/images/o_1.png": "d2a6d6146ed020fb1814f11bfc69709a",
"assets/assets/images/x_3.png": "711cc5adf394237450c9c344529702a7",
"assets/assets/images/x_1.png": "cfcca3bfbf68875bb24d0f8b688a8cf9",
"assets/assets/images/back_icon.png": "deafc5ceeff209842343bd6a704f2c8f",
"assets/assets/images/leaderboard.png": "8b0c9c7d04404ecc9c1d07287698636a",
"assets/assets/images/x_8.png": "c081b127d7641c3fa85e6e8a07433a35",
"assets/assets/images/x_5.png": "32659c757baf95100e664850ee7d5b72",
"assets/assets/images/x_4.png": "801d11f859f7ac0c10abaa90b35565e2",
"assets/assets/images/o_4.png": "235400aab55d3ff0733dd9ee76b3dd2c",
"assets/assets/images/o_6.png": "50631e56c4b7d61cc228b2527a014560",
"assets/assets/images/arrow_left.png": "62ea2ec50be04b1cbd62dd85bd6a2b07",
"assets/assets/images/x_6.png": "cc3f11d3cef2b75faccca7a0eb7e237e",
"assets/assets/images/two_players_icon.png": "c314e87ba2b3687928d83f3ed2ff704e",
"assets/assets/images/x_7.png": "961bbfa06a7375ed15c7210087b34252",
"assets/assets/images/draw.png": "db074914abe992c7770be3c97245cead",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"favicon.png": "d2057abf8e270a2daff6fe0ecf3f0404"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
