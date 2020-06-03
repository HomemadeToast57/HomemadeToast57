using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    public Rigidbody2D rb;

    public Vector3 startPosition;

    public string keybind;

    public float playerSpeed;

    private float verticalMove;

    private Vector2 movement;

    // Start is called before the first frame update
    void Start()
    {
        startPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {

        verticalMove = Input.GetAxisRaw(keybind);

        movement = new Vector2(0, verticalMove * playerSpeed * Time.deltaTime);

        var velocity = rb.velocity;

        rb.velocity = (movement);

    }

    public void Reset()
    {
        rb.velocity = Vector2.zero;
        transform.position = startPosition;
    }
}
