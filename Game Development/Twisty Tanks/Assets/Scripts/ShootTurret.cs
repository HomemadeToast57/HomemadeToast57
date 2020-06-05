using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShootTurret : MonoBehaviour
{
    public GameObject bulletPrefab;
    public Transform firePoint;
    public float bulletSpeed;
    public string playerCode;
    public int timeToBulletDestruction;
    public int maxAmmoCount;
    private int ammoCount;

    // Start is called before the first frame update
    void Start()
    {
        ammoCount = maxAmmoCount;
    }

    // Update is called once per frame
    void Update()
    {
        Shoot();
    }

    private void FixedUpdate()
    {
        
    }

    void Shoot()
    {
        if(playerCode == "P1")
        {
            if(ammoCount > 0 )
            {
                if (Input.GetKeyDown(KeyCode.Comma))
                {
                    GameObject bullet = Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
                    Rigidbody2D rb = bullet.GetComponent<Rigidbody2D>();
                    rb.AddForce(firePoint.up * bulletSpeed * Time.fixedDeltaTime, ForceMode2D.Impulse);
                    Destroy(bullet, timeToBulletDestruction);
                    ammoCount--;
                }
            }
        }

        if(playerCode == "P2")
        {
            if (ammoCount > 0)
            {
                if (Input.GetKeyDown(KeyCode.V))
                {
                    GameObject bullet = Instantiate(bulletPrefab, firePoint.position, firePoint.rotation);
                    Rigidbody2D rb = bullet.GetComponent<Rigidbody2D>();
                    rb.AddForce(firePoint.up * bulletSpeed * Time.fixedDeltaTime, ForceMode2D.Impulse);
                    Destroy(bullet, timeToBulletDestruction);
                    ammoCount--;
                }
            }

        }


    }

}
