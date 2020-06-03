using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BirdMovement : MonoBehaviour
{
    public float velocity = 0f;
    private Rigidbody2D rb;
    public GameManager gameManager;
    public GameObject getReady;

   
    // Start is called before the first frame update
    void Start()
    {
        rb = GetComponent<Rigidbody2D>();
        gameManager.gameOverCanvas.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {

        if (Input.GetButtonDown("Jump"))
        {
            Jump();
            SoundManagerScript.playSound("flapSound");
        }

    }

    private void Jump()
    {
        rb.velocity = Vector2.up * velocity;
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.collider.tag == "Pipe")
        {
            Destroy(this.gameObject);
            Destroy(getReady);
            gameManager.gameOver();
            SoundManagerScript.playSound("hitSound");
            
        }
    }
}
