using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PipeSpawner : MonoBehaviour
{

    public float maxTime = 1;
    private float timer = 0;
    public GameObject pipe;
    public float height;


    // Start is called before the first frame update
    void Start()
    {
        GameObject newPipe = Instantiate(pipe);
        newPipe.transform.position = transform.position + new Vector3(0, Random.Range(-height, height), 0);
        Destroy(newPipe, 14);
    }

    // Update is called once per frame
    void Update()
    {
        timer += Time.deltaTime * 2;

        if (timer > maxTime)
        {
            GameObject newPipe = Instantiate(pipe);
            newPipe.transform.position = transform.position + new Vector3(0, Random.Range(-height, height), 0);
            timer = 0;
            Destroy(newPipe, 14);

        }

        
    }
}
