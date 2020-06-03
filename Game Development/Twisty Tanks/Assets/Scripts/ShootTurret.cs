﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootTurret : MonoBehaviour
{
    public GameObject bulletPrefab;
    public Transform firePoint;
    public float bulletSpeed;
    public string playerCode;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Shoot();
    }

    void Shoot()
    {
        if(playerCode == "P1")
        {
            if(Input.GetKeyDown(KeyCode.Comma))
            {
                GameObject bullet = Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
                Rigidbody2D rb = bullet.GetComponent<Rigidbody2D>();
                rb.AddForce(firePoint.up * bulletSpeed * Time.deltaTime, ForceMode2D.Impulse);
            }
           
        }

        if(playerCode == "P2")
        {
            if (Input.GetKeyDown(KeyCode.V))
            {
                GameObject bullet = Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
                Rigidbody2D rb = bullet.GetComponent<Rigidbody2D>();
                this.transform.forward = this.GetComponent<Rigidbody2D>().velocity;
                rb.AddForce(firePoint.up * bulletSpeed * Time.deltaTime, ForceMode2D.Impulse);
            }

        }


    }
}
