/*********************************************************************
11	
12	 Copyright (C) 2015 by Wisllay Vitrio
13	
14	 This program is free software; you can redistribute it and/or modify
15	 it under the terms of the GNU General Public License as published by
16	 the Free Software Foundation; either version 2 of the License, or
17	 (at your option) any later version.
18	
19	 This program is distributed in the hope that it will be useful,
20	 but WITHOUT ANY WARRANTY; without even the implied warranty of
21	 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
22	 GNU General Public License for more details.
23	
24	 You should have received a copy of the GNU General Public License
25	 along with this program; if not, write to the Free Software
26	 Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
27	
28	 ********************************************************************/

/*
 * inverted_index.cuh
 *
 *  Created on: Dec 4, 2013
 *      Author: silvereagle
 */
#include <vector>
#include <cudpp.h>

#include "structs.cuh"

#ifndef INVERTED_INDEX_CUH_
#define INVERTED_INDEX_CUH_

struct InvertedIndex {
    int *d_index;				//Index that indicates where each list ends in the inverted index (position after the end)
    int *d_count;				//Number of entries for a given term in the inverted index
    Entry *d_inverted_index;  	//Inverted index
    float *d_norms;			//Cosine and L2 Norms of the input documents
    float *d_normsl1;		//L1 Norms of the input documents

    int num_docs;			//Number of documents
    int num_entries;		//Number of entries
    int num_terms;			//Number of terms

    __host__ __device__ InvertedIndex() :
        d_inverted_index(NULL),
        d_index(NULL),
        d_count(NULL),
        d_norms(NULL),
        d_normsl1(NULL),
        num_docs(0),
        num_entries(0),
        num_terms(0)
    {}

    __host__ __device__ InvertedIndex(Entry *d_inverted_index, int *d_index, int *d_count, float *d_norms, float *d_normsl1, int num_docs, int num_entries, int num_terms) :
        d_inverted_index(d_inverted_index),
        d_index(d_index),
        d_count(d_count),
        d_norms(d_norms),
        d_normsl1(d_normsl1),
        num_docs(num_docs),
        num_entries(num_entries),
        num_terms(num_terms)
    {}
};

__host__ void prefix_scan(int *d_out, int *d_in, int num_terms, unsigned int options);

__host__ CUDPPHandle create_exclusive_scan_plan(CUDPPHandle theCudpp, int num_elements, unsigned int options);

__host__ InvertedIndex make_inverted_index(int num_docs, int num_terms, std::vector<Entry> &entries);

__global__ void count_occurrences(Entry *entries, int *count, int n);

__global__ void mount_inverted_index_and_compute_tf_idf(Entry *entries, Entry *inverted_index, int *count, int *index, float *d_norms, float *d_normsl1, int n, int num_docs);

#endif /* INVERTED_INDEX_CUH_ */