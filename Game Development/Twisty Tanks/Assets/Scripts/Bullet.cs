using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    private Rigidbody2D rb;
    public int maxBounces;
    private int currentBounce;

    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        currentBounce = 0;
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.collider.CompareTag("Arena"))
        {
            if(currentBounce < maxBounces)
            {
                currentBounce++;
            } else if(currentBounce == maxBounces)
            {
                //Call in particle
                //Destroy particle
                Destroy(gameObject);
            }
        }
        if(collision.collider.CompareTag("P1"))
        {
            //Call some function of P1 damaged
            Destroy(gameObject);
        }
        if (collision.collider.CompareTag("P2"))
        {
            //Call some function of P1 damaged
            Destroy(gameObject);
        }
    }
}
