// InventoryClient.java
package com.its152l.bm4.grp7.shopease.client;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Component
@RequiredArgsConstructor
public class InventoryClient {
    private final RestTemplate restTemplate;

    @Value("${inventory.service.url}")
    private String inventoryServiceUrl; // e.g., http://localhost:8081

    public void decrementStock(Long productId, int quantity) {
        String url = inventoryServiceUrl + "/api/inventory/decrement";
        Map<String, Object> payload = Map.of("productId", productId, "quantity", quantity);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(payload, headers);

        ResponseEntity<String> resp = restTemplate.postForEntity(url, request, String.class);
        if (!resp.getStatusCode().is2xxSuccessful()) {
            throw new RuntimeException("Inventory decrement failed: " + resp.getStatusCode());
        }
    }
}
