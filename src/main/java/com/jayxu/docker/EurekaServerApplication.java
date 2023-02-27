/**
 * Authored by jayxu @2023
 */
package com.jayxu.docker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EurekaServerApplication {
    @SuppressWarnings("resource")
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerApplication.class, args);
    }
}
