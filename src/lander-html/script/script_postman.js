function apply_offer() {
    let list_ids = JSON.parse(pm.environment.get("offer_id_list"));
    let host = pm.environment.get("url_offer")
    let token = pm.environment.get("access_token_partner")
    list_ids.forEach(function (id) {
        let requestBody = {
            "applications": [
                {}
            ]
        }
        let request = {
            url: host + '/v1/market/offer/' + id + '/apply',
            method: 'POST',
            header: {
                'Authorization': 'Bearer ' + token
            },
            body: {
                mode: 'raw',
                raw: JSON.stringify(requestBody)
            }
        };

        pm.sendRequest(request, function (err, response) {
            // Xử lý kết quả response (nếu cần)
        });
    });
}

function approve_reject_applications(){
    {
        let list_ids = JSON.parse(pm.environment.get("application_id_list"));
        let host = pm.environment.get("url_offer")
        let endpoint = '/v1/applications/status'
        let token = pm.environment.get("access_token_advertiser")
        list_ids.forEach(function (id) {
            let requestBody = {
                "applications": [
                    {
                        "id": id,
                        "status": 1
                    }
                ]
            }
            let request = {
                url: host + endpoint,
                method: 'PUT',
                header: {
                    'Authorization': 'Bearer ' + token
                },
                body: {
                    mode: 'raw',
                    raw: JSON.stringify(requestBody)
                }
            };

            pm.sendRequest(request, function (err, response) {
                // Xử lý kết quả response (nếu cần)
            });
        });
    }
}



function main() {
    apply_offer()
    approve_reject_applications()
}

main()
