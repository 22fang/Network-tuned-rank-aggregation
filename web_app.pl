#!/usr/bin/perl
use LWP::UserAgent;
open(file,">","/home/rcf-40/wenhuiw/panfs/rank_aggregation/validation/OMIM/endeavour_app_output/103780_1_endeavour_result")or die"I can't read the file";
open(file1,">>","imple_endeavour_app_redo_redo.sh");
my $browser = LWP::UserAgent->new;
$species = "hsapiens";
$train_gene = "ENSG00000149295|ENSG00000093010|ENSG00000151834";
$test_gene = "ENSG00000121410|ENSG00000175899|ENSG00000171428";
$model="Annotation_EnsemblEst|Annotation_GeneOntology|Annotation_Interpro|Annotation_Kegg|Annotation_Swissprot|Expression_SuEtAl|Expression_SonEtAl|Precalculated_Ouzounis|Precalculated_Prospectr|CisRegModule|Motif|Blast";
my $SUSUI_URL = "http://homes.esat.kuleuven.be/~bioiuser/endeavour/tool/prioritize.php";
my $response = $browser->post( $SUSUI_URL,
['species' => $species,
'training' => $train_gene,
'test' => $test_gene,
'models' => $model]  );

if ($response->is_success) {
print file $response->content;
} else {
print file1 "perl /home/rcf-40/wenhuiw/cmb/rank_aggregation/validation/OMIM/endeavour_app/103780_1_webapp.pl;\n";
}
