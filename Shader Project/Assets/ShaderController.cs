using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShaderController : MonoBehaviour {

	public Material myMat;

	public float factor1 = 1;
	public float factor2 = 1;
	public float factor3 = 1;
	public float gridSize = 50;

	// Use this for initialization
	void Start () {
		myMat = gameObject.GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () {
		myMat.SetFloat("_Factor1", factor1);
		myMat.SetFloat("_Factor2", factor2);
		myMat.SetFloat("_Factor3", factor3);
		myMat.SetFloat("_GridSize", gridSize);

		factor1 = Random.RandomRange(1,50);
		factor2 = Random.RandomRange(1,50);
		factor3 = Random.RandomRange(1,50);
		gridSize = Random.RandomRange(1,50);
	}
}
