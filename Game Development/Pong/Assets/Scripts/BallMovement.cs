using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BallMovement : MonoBehaviour
{

    public float speed;

    public Rigidbody2D rb;

    public Vector3 startPosition;

    // Start is called before the first frame update
    void Start()
    {
        startPosition = transform.position;
        Launch();
    }

    public void Reset()
    {
        rb.velocity = Vector2.zero;
        transform.position = startPosition;
        Launch();
    }

    void Launch()
    {
        float x = Random.Range(0, 2) == 0 ? 1 : -1;
        float y = Random.Range(0, 2) == 0 ? 1 : -1;

        rb.velocity = new Vector2(speed * x * Time.deltaTime, speed * y * Time.deltaTime);
    }
}
