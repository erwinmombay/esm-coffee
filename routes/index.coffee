exports.index = (req, res) ->
    res.render 'index', title: 'Documentizr2'

exports.getFields = (req, res) ->
    res.send([
        {
            "Id": 1,
            "DisplayName": "BE Code",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 20,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 2,
            "DisplayName": "Name",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 3,
            "DisplayName": "Address 1",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 4,
            "DisplayName": "Address 2",
            "Type": "string",
            "ReqDes": "O",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 5,
            "DisplayName": "City",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 6,
            "DisplayName": "State/Province",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 7,
            "DisplayName": "Postal Code",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 3,
            "MaxSize": 15,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 8,
            "DisplayName": "Country",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 50,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 9,
            "DisplayName": "Primary Industry",
            "Type": "string",
            "ReqDes": "M",
            "MinSize": 1,
            "MaxSize": 3,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 10,
            "DisplayName": "ParentID",
            "Type": "int",
            "ReqDes": "0",
            "MinSize": 0,
            "MaxSize": 0,
            "Mask": "",
            "ValidationCodes": []
        },
        {
            "Id": 11,
            "DisplayName": "Test Entity",
            "Type": "bool",
            "ReqDes": "M",
            "MinSize": 0,
            "MaxSize": 0,
            "Mask": "",
            "ValidationCodes": []
        }
    ])

exports.getDocuments = (req, res) ->
    res.send([
        {
            "ID": 1,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "UNKNOWN-EC-0",
                    "OldValue": "UNKNOWN-EC-0"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "UNKNOWN",
                    "OldValue": "UNKNOWN"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 2,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "COGSLEYC-EC-1",
                    "OldValue": "COGSLEYC-EC-1"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "Cogsley Cogs",
                    "OldValue": "Cogsley Cogs"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "989 Cyberspace Dr",
                    "OldValue": "989 Cyberspace Dr"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "Moneyville",
                    "OldValue": "Moneyville"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "PA",
                    "OldValue": "PA"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "17757",
                    "OldValue": "17757"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 3,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "MCGRUPPP-EC-2",
                    "OldValue": "MCGRUPPP-EC-2"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "McGrupp Phish Sticks",
                    "OldValue": "McGrupp Phish Sticks"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "420 Icculus Drive",
                    "OldValue": "420 Icculus Drive"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "Burlington",
                    "OldValue": "Burlington"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "VT",
                    "OldValue": "VT"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "05405",
                    "OldValue": "05405"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 4,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "SPACELYS-EC-3",
                    "OldValue": "SPACELYS-EC-3"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "Spacely Sprockets",
                    "OldValue": "Spacely Sprockets"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "Spacedock 109",
                    "OldValue": "Spacedock 109"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "Los Allmamoney",
                    "OldValue": "Los Allmamoney"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "AZ",
                    "OldValue": "AZ"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "85111",
                    "OldValue": "85111"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 5,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "TESTACCO-EC-4",
                    "OldValue": "TESTACCO-EC-4"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "Test Account",
                    "OldValue": "Test Account"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 6,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "ACMESUPE-EC-5",
                    "OldValue": "ACMESUPE-EC-5"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "ACME SUPERMARKETS",
                    "OldValue": "ACME SUPERMARKETS"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "ACME ROAD",
                    "OldValue": "ACME ROAD"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "DAYTON",
                    "OldValue": "DAYTON"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "OH",
                    "OldValue": "OH"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "45432",
                    "OldValue": "45432"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 7,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "ALLROUND-EC-6",
                    "OldValue": "ALLROUND-EC-6"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "ALL ROUND FOODS #2",
                    "OldValue": "ALL ROUND FOODS #2"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "16 WINDING LANE",
                    "OldValue": "16 WINDING LANE"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "UPPER BROOKVILLE",
                    "OldValue": "UPPER BROOKVILLE"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "NY",
                    "OldValue": "NY"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "11545",
                    "OldValue": "11545"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 8,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "SYSCOCOR-EC-7",
                    "OldValue": "SYSCOCOR-EC-7"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "SYSCO CORPORATION",
                    "OldValue": "SYSCO CORPORATION"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "1390 ENCLAVE PARKWAY",
                    "OldValue": "1390 ENCLAVE PARKWAY"
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "HOUSTON",
                    "OldValue": "HOUSTON"
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "TX",
                    "OldValue": "TX"
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "77077",
                    "OldValue": "77077"
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 9,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "MERKUR-EC-8",
                    "OldValue": "MERKUR-EC-8"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "MERKUR",
                    "OldValue": "MERKUR"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        },
        {
            "ID": 10,
            "Fields": {
                "FieldItems": [{
                    "FieldDescriptorId": 1,
                    "Name": "code",
                    "Value": "TESTHUB-EC-9",
                    "OldValue": "TESTHUB-EC-9"
                },
                {
                    "FieldDescriptorId": 2,
                    "Name": "name",
                    "Value": "TESTHUB",
                    "OldValue": "TESTHUB"
                },
                {
                    "FieldDescriptorId": 3,
                    "Name": "address1",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 4,
                    "Name": "address2",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 5,
                    "Name": "city",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 6,
                    "Name": "stateOrProvince",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 7,
                    "Name": "postalCode",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 8,
                    "Name": "country",
                    "Value": "US",
                    "OldValue": "US"
                },
                {
                    "FieldDescriptorId": 9,
                    "Name": "primaryIndustry",
                    "Value": "",
                    "OldValue": ""
                },
                {
                    "FieldDescriptorId": 10,
                    "Name": "parentID",
                    "Value": "0",
                    "OldValue": "0"
                },
                {
                    "FieldDescriptorId": 11,
                    "Name": "edictTestEntity",
                    "Value": "False",
                    "OldValue": "False"
                }]
            },
            "FieldDescriptors": null
        }
    ])

exports.postDocuments = (req, res) ->
    id = req.params.id
    if id
        idResp = id: id
    else
        idResp = id: (Math.random() * 1000) | 0
    res.json idResp
