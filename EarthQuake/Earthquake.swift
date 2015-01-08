import Foundation

class Earthquake: NSObject {
    let json: JSON
    let detail: Any
    let latitude: Any
    let longitude: Any
    let time: Any
    let mag: Any

    init(json: JSON) {
        self.json = json
        self.detail = json["properties"]["detail"]
        self.latitude = json["geometry"]["points"][1]
        self.longitude = json["geometry"]["points"][0]
        self.time = json["properties"]["time"]
        self.mag = json["properties"]["mag"]
    }
}

// Basic:
//[id: usc000tcxe,
//    geometry: [
//        coordinates: [152.6448, -6.1942, 10],
//        type: Point
//    ],
//    properties: [
//        time: 1420667470310,
//        type: earthquake,
//        status: reviewed,
//        dmin: 2.046,
//        updated: 1420668970959,
//        tz: 600,
//        sig: 385,
//        detail: http://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/usc000tcxe.geojson,
//        mag: 5,
//        mmi: null,
//        types: ,dyfi,general-link,geoserve,nearby-cities,origin,phase-data,tectonic-summary,,
//        alert: null,
//        rms: 0.66,
//        title: M 5.0 - 195km SSW of Taron, Papua New Guinea,
//        url: http://earthquake.usgs.gov/earthquakes/eventpage/usc000tcxe,
//        tsunami: null,
//        cdi: 1,
//        place: 195km SSW of Taron, Papua New Guinea, sources: ,us,,
//        code: c000tcxe,
//        gap: 37,
//        nst: null,
//        ids: ,usc000tcxe,,
//        net: us,
//        felt: 0,
//        magType: mb],
//    type: Feature
//]

// Detail:

//{
//    "type": "Feature",
//    "properties": {
//        "mag": 5,
//        "place": "195km SSW of Taron, Papua New Guinea",
//        "time": 1420667470310,
//        "updated": 1420668970959,
//        "tz": 600,
//        "url": "http://earthquake.usgs.gov/earthquakes/eventpage/usc000tcxe",
//        "felt": 0,
//        "cdi": 1,
//        "mmi": null,
//        "alert": null,
//        "status": "reviewed",
//        "tsunami": null,
//        "sig": 385,
//        "net": "us",
//        "code": "c000tcxe",
//        "ids": ",usc000tcxe,",
//        "sources": ",us,",
//        "types": ",cap,dyfi,general-link,geoserve,nearby-cities,origin,phase-data,tectonic-summary,",
//        "nst": null,
//        "dmin": 2.046,
//        "rms": 0.66,
//        "gap": 37,
//        "magType": "mb",
//        "type": "earthquake",
//        "title": "M5.0  - 195km SSW of Taron, Papua New Guinea",
//        "products": {
//            "cap": [
//            {
//            "indexid": "4810466",
//            "id": "urn:usgs-product:us:cap:usc000tcxe:1420668942040",
//            "type": "cap",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe"
//            },
//            "preferredWeight": 6,
//            "contents": {
//            "capalert.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1420669201000,
//            "length": 4382,
//            "url": "http://earthquake.usgs.gov/product/cap/usc000tcxe/us/1420668942040/capalert.xml"
//            },
//            "contents.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1361466352000,
//            "length": 194,
//            "url": "http://earthquake.usgs.gov/product/cap/usc000tcxe/us/1420668942040/contents.xml"
//            }
//            }
//            }
//            ],
//            "dyfi": [
//            {
//            "indexid": "4810430",
//            "id": "urn:usgs-product:us:dyfi:usc000tcxe:1420668970959",
//            "type": "dyfi",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668970959,
//            "status": "UPDATE",
//            "properties": {
//            "depth": "10",
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "eventtime": "2015-01-07T21:51:10.000Z",
//            "latitude": "-6.1942",
//            "longitude": "152.6448",
//            "magnitude": "5.0",
//            "maxmmi": "1",
//            "num-responses": "0",
//            "numResp": "0"
//            },
//            "preferredWeight": 156,
//            "contents": {
//            "contents.xml": {
//            "contentType": "application/octet-stream",
//            "lastModified": 1420668970000,
//            "length": 894,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/contents.xml"
//            },
//            "event_data.xml": {
//            "contentType": "application/octet-stream",
//            "lastModified": 1420668970000,
//            "length": 1272,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/event_data.xml"
//            },
//            "polygons_lonlat.txt": {
//            "contentType": "text/plain",
//            "lastModified": 1420668970000,
//            "length": 0,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/polygons_lonlat.txt"
//            },
//            "usc000tcxe_ciim.jpg": {
//            "contentType": "image/jpeg",
//            "lastModified": 1420668970000,
//            "length": 170782,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/usc000tcxe_ciim.jpg"
//            },
//            "usc000tcxe_ciim.pdf": {
//            "contentType": "application/octet-stream",
//            "lastModified": 1420668970000,
//            "length": 132160,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/usc000tcxe_ciim.pdf"
//            },
//            "usc000tcxe_ciim.ps": {
//            "contentType": "application/postscript",
//            "lastModified": 1420668970000,
//            "length": 374055,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/usc000tcxe_ciim.ps"
//            },
//            "usc000tcxe_ciim_imap.html": {
//            "contentType": "text/html",
//            "lastModified": 1420668970000,
//            "length": 48,
//            "url": "http://earthquake.usgs.gov/product/dyfi/usc000tcxe/us/1420668970959/usc000tcxe_ciim_imap.html"
//            }
//            }
//            }
//            ],
//            "general-link": [
//            {
//            "indexid": "4810419",
//            "id": "urn:usgs-product:us:general-link:usc000tcxe-0:1420668942040",
//            "type": "general-link",
//            "code": "usc000tcxe-0",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "text": "Additional earthquake information for Papua New Guinea",
//            "url": "http://earthquake.usgs.gov/earthquakes/world/index.php?regionID=70"
//            },
//            "preferredWeight": 6,
//            "contents": []
//            }
//            ],
//            "geoserve": [
//            {
//            "indexid": "4810422",
//            "id": "urn:usgs-product:us:geoserve:usc000tcxe:1420668942040",
//            "type": "geoserve",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "location": "195km SSW of Taron, Papua New Guinea",
//            "tsunamiFlag": "true",
//            "utcOffset": "600"
//            },
//            "preferredWeight": 6,
//            "contents": {
//            "geoserve.json": {
//            "contentType": "application/json",
//            "lastModified": 1420668951000,
//            "length": 7437,
//            "url": "http://earthquake.usgs.gov/product/geoserve/usc000tcxe/us/1420668942040/geoserve.json"
//            }
//            }
//            }
//            ],
//            "nearby-cities": [
//            {
//            "indexid": "4810421",
//            "id": "urn:usgs-product:us:nearby-cities:usc000tcxe:1420668942040",
//            "type": "nearby-cities",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe"
//            },
//            "preferredWeight": 6,
//            "contents": {
//            "nearby-cities.inc.html": {
//            "contentType": "text/html",
//            "lastModified": 1420668950000,
//            "length": 295,
//            "url": "http://earthquake.usgs.gov/product/nearby-cities/usc000tcxe/us/1420668942040/nearby-cities.inc.html"
//            },
//            "nearby-cities.json": {
//            "contentType": "application/json",
//            "lastModified": 1420668950000,
//            "length": 645,
//            "url": "http://earthquake.usgs.gov/product/nearby-cities/usc000tcxe/us/1420668942040/nearby-cities.json"
//            }
//            }
//            }
//            ],
//            "origin": [
//            {
//            "indexid": "4810417",
//            "id": "urn:usgs-product:us:origin:usc000tcxe:1420668942040",
//            "type": "origin",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "azimuthal-gap": "37",
//            "depth": "10",
//            "depth-type": "OPERATOR_ASSIGNED",
//            "evaluation-status": "preliminary",
//            "event-type": "earthquake",
//            "eventParametersPublicID": "quakeml:us.anss.org/eventparameters/c000tcxe/1420668946",
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "eventtime": "2015-01-07T21:51:10.310Z",
//            "horizontal-error": "9.4",
//            "latitude": "-6.1942",
//            "longitude": "152.6448",
//            "magnitude": "5.0",
//            "magnitude-error": "0.067",
//            "magnitude-num-stations-used": "72",
//            "magnitude-source": "us",
//            "magnitude-type": "mb",
//            "minimum-distance": "2.046",
//            "num-phases-used": "48",
//            "origin-source": "us",
//            "quakeml-publicid": "quakeml:us.anss.org/event/c000tcxe",
//            "review-status": "reviewed",
//            "standard-error": "0.66",
//            "vertical-error": "1.8"
//            },
//            "preferredWeight": 156,
//            "contents": {
//            "contents.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1420668948000,
//            "length": 195,
//            "url": "http://earthquake.usgs.gov/product/origin/usc000tcxe/us/1420668942040/contents.xml"
//            },
//            "quakeml.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1420668942000,
//            "length": 3721,
//            "url": "http://earthquake.usgs.gov/product/origin/usc000tcxe/us/1420668942040/quakeml.xml"
//            }
//            }
//            }
//            ],
//            "phase-data": [
//            {
//            "indexid": "4810418",
//            "id": "urn:usgs-product:us:phase-data:usc000tcxe:1420668942040",
//            "type": "phase-data",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "azimuthal-gap": "37",
//            "depth": "10",
//            "depth-type": "OPERATOR_ASSIGNED",
//            "evaluation-status": "preliminary",
//            "event-type": "earthquake",
//            "eventParametersPublicID": "quakeml:us.anss.org/eventparameters/c000tcxe/1420668946",
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "eventtime": "2015-01-07T21:51:10.310Z",
//            "horizontal-error": "9.4",
//            "latitude": "-6.1942",
//            "longitude": "152.6448",
//            "magnitude": "5.0",
//            "magnitude-error": "0.067",
//            "magnitude-num-stations-used": "72",
//            "magnitude-source": "us",
//            "magnitude-type": "mb",
//            "minimum-distance": "2.046",
//            "num-phases-used": "48",
//            "origin-source": "us",
//            "quakeml-publicid": "quakeml:us.anss.org/event/c000tcxe",
//            "review-status": "reviewed",
//            "standard-error": "0.66",
//            "vertical-error": "1.8"
//            },
//            "preferredWeight": 156,
//            "contents": {
//            "contents.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1420668949000,
//            "length": 195,
//            "url": "http://earthquake.usgs.gov/product/phase-data/usc000tcxe/us/1420668942040/contents.xml"
//            },
//            "quakeml.xml": {
//            "contentType": "application/xml",
//            "lastModified": 1420668942000,
//            "length": 165920,
//            "url": "http://earthquake.usgs.gov/product/phase-data/usc000tcxe/us/1420668942040/quakeml.xml"
//            }
//            }
//            }
//            ],
//            "tectonic-summary": [
//            {
//            "indexid": "4810420",
//            "id": "urn:usgs-product:us:tectonic-summary:usc000tcxe:1420668942040",
//            "type": "tectonic-summary",
//            "code": "usc000tcxe",
//            "source": "us",
//            "updateTime": 1420668942040,
//            "status": "UPDATE",
//            "properties": {
//            "eventsource": "us",
//            "eventsourcecode": "c000tcxe",
//            "review-status": "Automatic"
//            },
//            "preferredWeight": 6,
//            "contents": {
//            "tectonic-summary.inc.html": {
//            "contentType": "text/html",
//            "lastModified": 1420668950000,
//            "length": 6018,
//            "url": "http://earthquake.usgs.gov/product/tectonic-summary/usc000tcxe/us/1420668942040/tectonic-summary.inc.html"
//            }
//            }
//            }
//            ]
//        }
//    },
//    "geometry": {
//        "type": "Point",
//        "coordinates": [
//        152.6448,
//        -6.1942,
//        10
//        ]
//    },
//    "id": "usc000tcxe"
//}