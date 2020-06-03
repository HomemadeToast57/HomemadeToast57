using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BumperMovement : MonoBehaviour
{

    public GameObject player;
    public float speed;
    private Vector3 zAxis = new Vector3(0, 0, 1);
    private float move;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        move = Input.GetAxis("Horizontal");
        
        OrbitAround();
    }

    void OrbitAround()
    {
        transform.RotateAround(player.transform.position, zAxis, speed * Time.deltaTime * -move);
    }
}
