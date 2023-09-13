package com.example.learn_be.config.jwt;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.SignatureException;
import org.springframework.beans.factory.annotation.Value;

import javax.crypto.SecretKey;

import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class JwtService {
    @Value("${jwt.secret.key}")
    private String secretKey;

    @Value("${jwt.expiration}")
    private Long expiration;

    // Hàm getKey() được sử dụng để tạo ra 1 khóa bí mật (SecretKey) từ chuỗi bí mật tại application.properties.
    // Hàm này sử dụng thuật toán HMAC SHA để tạo ra khóa bí mật.
    // Đầu vào: Không có.
    // Đầu ra: Một đối tượng SecretKey được tạo ra từ chuỗi ký tự secretKey đã cho

    private SecretKey getKey() {
        return Keys.hmacShaKeyFor(secretKey.getBytes());
    }

    public String generateToken(String username) {
        return Jwts.builder() //.builder() tạo 1 đối tượng jwtBuilder.
                .setSubject(username) //.setSubject() thiết lập thông tin người dùng cho token
                .setIssuedAt(new Date(System.currentTimeMillis())) //.setIssuedAt() thiết lập thời gian phát hành token
                .setExpiration(new Date(System.currentTimeMillis())) //.setExpiration() thiết lập thời gian hết hạn token
                .signWith(getKey(), SignatureAlgorithm.ES512) //.signWith() thiết lập thuật toán mã hóa và khóa bí mật
                .compact(); //.compact() để tạo chuỗi token
    }

    public Claims getClaims(String token) { // giải mã token để lấy thông tin người dùng
        return Jwts.parserBuilder().setSigningKey(getKey()).build().parseClaimsJws(token).getBody();
    }

    public String getUserName(String token) {
        return getClaims(token).getSubject();
    }

    public boolean validateToken(String token) {
        try {
            Jwts.parserBuilder().setSigningKey(getKey()).build().parseClaimsJws(token);
            return true;
        } catch (SignatureException e) {
            System.out.println("Incorrect signature: \n" + e.getMessage() + "");
        } catch (SecurityException | MalformedJwtException e) {
            System.out.println("Invalid JWT signature. \n" + e.getMessage() + "");
        } catch (ExpiredJwtException e) {
            System.out.println("Expired JWT token. \n" + e.getMessage() + "");
        } catch (UnsupportedJwtException e) {
            System.out.println("Unsupported JWT token. \n" + e.getMessage() + "");
        } catch (IllegalArgumentException e) {
            System.out.println("JWT claims string is empty. \n" + e.getMessage() + "");
        }
        return false;
    }
}
