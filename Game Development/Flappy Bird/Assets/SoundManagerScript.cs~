using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SoundManagerScript : MonoBehaviour
{

    public static AudioClip pointSound;
    public static AudioClip deathSound;
    public static AudioClip flapSound;
    public static AudioClip hitSound;

    static AudioSource audioSrc;

    // Start is called before the first frame update
    void Start()
    {
        pointSound = Resources.Load<AudioClip>("sfx_point");
        deathSound = Resources.Load<AudioClip>("sfx_die");
        hitSound = Resources.Load<AudioClip>("sfx_hit");
        flapSound = Resources.Load<AudioClip>("sfx_wing");

        audioSrc = GetComponent<AudioSource>();
    }

    public static void playSound(string n)
    {

        if(n == "pointSound")
        {
            audioSrc.PlayOneShot(pointSound);
        }

        if (n == "deathSound")
        {
            audioSrc.PlayOneShot(deathSound);
        }

        if (n == "flapSound")
        {
            audioSrc.PlayOneShot(flapSound);
        }

        if (n == "hitSound")
        {
            audioSrc.PlayOneShot(hitSound);
        }
    }
}
