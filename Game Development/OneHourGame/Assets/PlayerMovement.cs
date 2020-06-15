using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlayerMovement : MonoBehaviour
{

    public Rigidbody2D rb;
    private float horizontalInput;
    public float moveSpeed;
    public float jumpForce;
    public bool isGrounded;
    private Vector3 jump;
    public Canvas win;
    

    // Start is called before the first frame update
    void Start()
    {
        rb = gameObject.GetComponent<Rigidbody2D>();
        jump = new Vector3(0.0f, 2.0f, 0.0f);
    }

    // Update is called once per frame
    void Update()
    {
        GetPlayerInput();
        Movement();

        if(transform.position.y < -20)
        {
            reloadScene();
        }
    }

    void GetPlayerInput()
    {
        horizontalInput = Input.GetAxis("Horizontal");
    }

    void Movement()
    {
        transform.position += new Vector3(horizontalInput * moveSpeed * Time.deltaTime, 0);

        if (Input.GetButtonDown("Jump") && isGrounded)
        {

            rb.AddForce(jump * jumpForce, ForceMode2D.Impulse);
            isGrounded = false;
        }
    }

    private void OnCollisionEnter2D(Collision2D collision)
    {
        if(collision.collider.CompareTag("Ground"))
        {
            isGrounded = true;
        }
        if (collision.collider.CompareTag("Finish"))
        {
            win.enabled = true;
            Invoke("reloadScene", 4);
        }
    }

    void reloadScene()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}
