CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102540        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?�A��;?��P�1?���� r?�o@�@�9Nl�@��c�[@,|���Q@!��s@&[80	@,T`"�B�@1�>�W	�@5?�Y���@9Z�quݎ@=�͠���@AY�w��@C�{��@F��઩@I�M(�G�@L�2�d��@P-�-�)=@Q�);s5@S֓A�@U���j�@W����Hh@ZZM-�@\Ep9���@^��q�/�@`�����@a��z�@ce���K@dm R�@e��}4��@g?���d@h��}hX�@j>��E�m@k΄�&^�@mi.��R@o{�K��@p_OLG�l@q<��l\�@r���.�@s�~�|�@s�b+��`@t�V�~b@u��"@v�G��D@w�:���Z@x�}?Υ�@y�7沝@{
>|w�@|"[�jk�@}@(���@~c{G���@�g��L�@�]?�s@����.ed@����*��@�4�/�~�@��rh�Ƹ@�}3���@�%���!@�ѡ�v�U@��oWp�<        ?p�����?�f�&�@?�0��C?Ƥ�9��A?��B1!�?��x��>?�N.$���?�},���?�4YB�?����Q�?����=�@����2�@�A�I@cVt(@|����f@0���@#���@T���@�P
$@ ?x���@"=��t�6@$`{z�e�@&����k@)�/�&@+�W�Q�@.w�St�@0�q�^@2G���'@3��t�@5����[@7����,�@9�0����@;��3��@>H
�rk@@@���6�@A�R\��@B�� �@DZ�2��@E�����9@G��b�\@I8
�@K��$@L�I���@N��=׺@P�%wv��@Q���tY�@Rѫ,��@T6��z@UXL�;\�@V���B�G@X �B��@Y��=@p@[-D��q@\�%w�!�@^��5�d@`&4D�@a&.Ѫ@bx�Q�q@cK1��@d޷6�@e5q��' @fY?޵�@g�����        ?t�r����?��,��?���pz�8?ͼ�N'�7?�,̏�dl?����&�?�ǖ���?�j�UGi?��+����@6��@!�F�@�� t�@�1��@���Qi�@o���Ex@��܋�-@!EX�>o�@#��~֟\@&�]�GF$@)��;�@-FzQj9@0zo����@2w�T[\@4�_�YJ@6��ʺ��@9hP�K�'@<́<��@>�O��|�@@�c�E.�@B�[�&@DUs� i�@F+����@H@+� @J.e^f�@L\�tԽ�@N�~�土@P����@Q�1���j@S+u�F@T���@V�}@W��(Nɺ@Y5����@Z�켴@\�x���@^x����,@`/8ˡ�@a+���4@b1�]�n-@cA�ݏsN@d\F�I�@e�:$`��@f�!L�@g�=iTm@i3;'Z6@j���̶@k�n⧛@mQ�ϝ�@n��(8O@p)�f�.�@p�����@q�4�@r�� �        @�3��@6��z^�@P�hoZ� @a�l���@o�{�|�@w�ޔ�ڲ@�N���@�0���T/@�-�� c�@�����@�x(��Nx@�\<���S@��(fCt.@��
�;F�@��d�R�@�K����j@�����@�ݸ����@����#@��껭�@�F��d\+@��a�֬P@��|M�@���O�W@����	I@�F|���@�z�G>�*@����h
@�̸[�@�0%��@ɶ��=*@�d�M	T�@�T���@��<):@�[�����@�J�%;:�@�?���@�:k=��J@�;�/5@�Aj�
;@�M�m�[�@�_~���@�w(^::�@ٔ�.DeP@ڷ���@��V��@��H"p�@�D3�x�z@�~��ٚ@�_��@��Y>Z�@�AR`�o@�R��l=�@���2T@㮵�ɪ�@�ao��8(@�O���@��Y4��t@挏r�R�@�K�8ȶB@��۴��@��|R���@靲?z�        ?F�z��Ha?|m�,?���A��?�9z�5<V?��w�Df�?�ˈ�B1�?��ī/j�?�d���e)?��?��f?�T��P��?︸��+?�h����?�OtJz?��[eXj@ ��i@�����1@1b;n��@�U�O�@l0ˆ=@.'��@���E�t@��m�N�@h�yC�@_INK�@n�ԑϯ@�����w@�h~iw6@1P"��@ �Jv\��@"��J��@#lr�]�0@$�{�}�@&<4�V
@'��D��@)C�E�`%@*ݜ�7Ϣ@,�G�@�@.>I��1�@0����@0�̋9!b@1�	 �@2���J�@3���{@4��kr�@6 �杤@7 ����@8D��|v@9qC-�c�@:�^�s�e@;�2� @=$�l3J�@>o�5�#�@?�w��@@�u/��@A?����@A�~�@B�q��f�@Cjrq�<@D+��h��@D��w9�@E��H�ќ@F���bC�@G[���        ?+�~�H#�?e�-Fx�?�~nY'K�?��5�;��?��!tF?�X��U?���k?�8oy��?�
��)b�?�iJ�8�?���8�Y?�'�-�_Y?�ET��?��v=��:?��Q<��?�]Չ��?�]�td�b?���h�d@\���@�D C@^�3^�i@_6a��@Q8�Y�@ q� my@� ~���@��*��@��E.�@?�Ш��@!�x�N@#6��@%�q�B��@(�Y��x@*�UV���@-�~����@0���^ 5@2[��}�@4B;&@6MO�B��@8~Y]���@:���''�@=X̭���@@�z7l@Ao�Qߝf@B�X��@D������@FD���?'@H,R>��@I�0RO��@Lڜ섺@N%��#�@P2���;@Qa6�^^�@R���,�@S싴A9�@UI����@V�j���_@X5e1OR@Y��C8�@[c�	��@]�P;��@^�p
S?@`U�i:Hx@aI9�r<        ?eܪ���?P�E p��?p]��@��?��"{��8?��b����?�:��N^�?��/a�0?���[?�,|&&U?ű-���`?�u�e
_Q?ӛ�	�}?٦=}���?��c�$�?�%F��%?�^���i?�]k�Gf?��T�?�s��-�T?�z�Ƿb�@���h�O@��f4@���G @�7�� .@�'���@b"���K@K$�a3�@����M{@:QMo�@ w��XU@"�Y�@[@$�'�?@'f$j+�@*|��t@-Z޿�@0�/�@1ťĨM�@3��Զ@5��ͱ5Q@7�5n�i�@9����_�@<�=�<�@>�y�H�@@���v�q@A��O�@Ci�&
�@D�����@F���9�@HD`���@J�Ʈ�@K�^7�0@M�J��@O�a�@s@Q
�ȁ�+@R)��IQ@ST���T{@T�$�n@U����2@W$c�H�@X�5�a�\@Y����?�@[mo+8f+@\�[)�N�        ?��y�"��?ޢ�x�8?��r�w@N�wRܑ@"��bVЈ@.�����@7/6��"@@.���X@Eu,�@K�'�wE�@Q5Z��Q@T�L8��@X���$D5@]3 t�@`�V���@cr���R�@fm��v�@h�.�T�@k��v�E@ov����@q9#� @r�>UB�@t�x�[TJ@v�ʞ@x� ��N�@z쐄��l@}#d��;i@q��[�%@�����y@�++�X3@�v�x$��@������P@�4n,�J@��n��@�&%����@����幂@�N���@��e�}X}@��k�Ƨd@�����B@��s�
�@���.l��@��ըÚ�@��Z-��A@��]U ��@���n��@�ůD�f@����ja@�{��.(@�9X���@�nyiS��@��ڂt�@��}�S�U@�����l@��׺Y@�r�K��7@�#I�T-P@�׷�<�@��`-0g@�L[&
�@�����>@��9�>�z@���'�v�        ?m��J�Xn?�7to��?��}���?�D�*J��?��T�ܛ?�s�x~Y?�g�|�г?��M^��@u�#i7�@
!�Q��@AQ1o�@�"��~@�Eަm�@�-�Ok@ U9E*2�@"ݡƦ4@%�<���}@(�V�V�@+��$W�@/й��@1VcN�@3=��9��@5@�˰v�@7`�$�@9���;�@;�o��@>c&
��@@x�!�	^@A�$��@C2f��"J@D��쟈@F(ݻľ�@G��/D@I]�18D�@K�Q\>@L��X�>�@N��(��@PAWe�v�@Q9�̴��@R:Z-���@SC9���@TT'�@UmG85Xs@V��B�^b@W�xA"\
@X�C���@Z#����@[ed�"�@\�8����@]�+��@_T�*c�@`Y&��tq@a
��܃@a���@�@bw�5s�t@c2���y]@c�1d��@d���ZC�@eu�+���@f<��
̞@g�!�f�@g���{�x@h��/�KE        ?\�[��?�)��-d?�6Gp?�M?�Ő����?�`:[���?�}��:?�T!��Sj?��g����?�R��!�?��F��@ק��+.@Ϙ�bX�@
7r�!e@$~��@3o���@w��	i@C�Q @��a�n@^���)�@!�}���@#��`�@&��t6@(�>�38d@+&b����@-��7��@0xa�r�|@2ru���@3�EV��,@5�����@7�٫��@9���tQf@;Б�S}�@>)B�f�	@@S�&	|�@A�{�~��@CI,��@D�����@F'�5A@G�����@Iz���v@KM!��-@M6A$�}@O6� ��@P����Q@Q�47B�@R�F4�z�@T-{N�k@UV7ӄ�	@V���D�Q@W��Φ��@YeE*�)�@Z��=�_!@\a#� cm@]���&@_������@`��H��@a�r�^��@bm��Ri!@c]v�3U@dUJ�u7@eT`���C@f[z���@gj[F1��        ?s�OIR�]?�0�Ils?�H�`��?�<3�^�?�ӣ\�+?�Y�6�3?��݊��?��9CmDN@��]Y�u@	�`���#@�s{sa@#h=���@�x[MBS@�l��s@���K�	@!�R"�4�@$���W@&�G�z�]@)��c"�@,�tQo�@0 R�X�o@1�X���@3��F�k@5��.i�@7�T���J@:6�44[@<�i:��@?I�z\A�@AA��V@B���� N@Dq���@E������@G|��=q@IY!��]@KQ�K9@Me�;- �@O��^�;@P���v�@R/]{!s�@Sz@�d��@T����@VF�0�@W�I�ۈ@Y^��@['��5@\���(�T@^�3�n>�@`B�dN��@aC7s}��@bOnX��r@cg�mboI@d���O��@e���|�@f�����@hH��pwi@i��ލXe@k��ëv@l}�-rQ�@m��x��N@o��|@p����&@qm*m�X@rJG�/��        ?�+{�n'^@��*�$S@8�����@LW���QA@Y��+��@d
�$T�@l�WY�@s�2�<�@yx�"AM[@�M���@������@���H �@���0��@�u���=�@�(���@��W1tMD@����@�;�I�Cu@����e��@��Ҿ��'@��k}�@���$��@�3���?@��i�l��@�9�ރ�@��a���h@�8,P'@�����7@�*1�Ò@��Ǿwu�@�:�����@��˚"�Z@���5z>R@�P1�6@����$@���Q�k@��
O��R@��Mjed4@��N<��@��D]��@��m�b�@�xw�;@�.7u�=�@�S#��q@���rRF@ʴ>^�F@���_��@�2ʂ���@�|o` @��_Z���@Б��u@�>��\�L@��MF��@ҡ�b�&@�U�S"�@�L���@��J���@��9�Y@�=��kP@��dS��@׾+���@؂|�J��@�Iz�O        ?X�J's?��P�P@�?�\��"0-?���2U�?����\?�143��?�#>�	?�U�^�!�?�>ח�R?�$ƕM@ Z�[�R0@0��?m@#��M@�$����@�=�%��@\!�y��@-�U!@1�)pgG@g���Q?@�:���&@!�:-0
�@#�e6y@%��H�PH@'����K�@)�"���@,�L�7/@.|����@0x��u�@1�C��k@3h`�@4oK{`r�@5��y`��@7N����@8η��CP@:Z��˫Q@;�n��zy@=�N��p�@?CfE^�@@~H�Z@A`P_�j�@BG�\{��@C4X��u�@D&'�K��@E)?VL@F���*u@G�M�m�@H�H)d�@I(����@J7y�"�@KJH ��@LaH�� �@M|]�M�@N�pV��P@O�n�`H�@Pr�{16@QY�i@Q�Mi��@R8{ �J@RӉ'�λ@Spp��@T)�em�@T��(��j@UQ�]9        ?<�^[Is�?v	�L�M8?�Ϡ���?��R����?���;�q?�$���?ϴ�M)�z?�Uˋ��)?��Ą�?�-�7J?��}��?�p�Z3�?�e
p'7?�� �+@;?�����;@O"�n@:�W���@ׂU3�@���.`�@B�u�N@֗04 �@�5�g�g@�{��@v8��k@ 0&�x�@"WOK�O@$��庐�@'G��U`�@*����<@-#m:��@08b7�C�@2 ���@3�t�{�r@5�����K@83���i@:�����@=��%�@?�2�7�@AQRV��@Bԉ�LB@Dn_q��g@F�|/@G�	���@I�ߑ���@K�06��M@MЪ"/fr@O��sTt�@Q ۃh|)@RQ8˕�@S�P	>�@T�\�<6�@V5���MK@W�"��+�@Y5�^U@Z��*gm@\/u�L�@]��]z`@_�����=@`�����@a�w�qy�@b}(���@cu�t\��@dv� <        ?1��YӀ�?d�ף�f?��|�K��?�\���?���#���?����4�?����q��?�ABH7	�?�)���?Щ��!?ձc8U�?ۺm�nA�?�s�>���?�R! �?�+��)�?�0�\�x?�
����?�J\~��?��+(ڿ�@ ;�T@�K�S[@�x�d@	l�R\�y@.��+(@���1*&@�~Т�@em*��Z@�}`�@����!@"&�h��@ ���6@"�&�:�;@$������@&��p8��@(�c���@+1MT�o�@-��5��@00��x�@1��'�@3ҲW�@4�J��,�@6X�y`��@8���^$@9�[/Q�@;�D��t@=��"K��@@�M��_@A R��@BI�7x�I@C���F@Dæa���@F��ւK@Gs��K�]@H�X�1�@J[�J/5@K�h�@M|U|��@O!��Wp�@Pj��?@QL^����@R5�`�;@S%?``��@Tߏ�QB        ?�*�&��O?��D�L�M@�]>t@&�2p���@5@�T^3�@A:lQ�@Iqņ��@Q��D���@WT��� �@]�L�@b�P @�C@f����G�@k��y0@oٙV?�o@r�8���@uPz3˞@xKuTZ�@{wE@�|@~���/C@�/n�,�f@� ���@�I< ��@��<�(@�1��`]@�k��f\�@���~idV@���j�{@�P����O@���(;n�@��6�Ԭ@�P��6z�@��_*� @�2�|=�@���b��@�?�o�ա@��~˻@�w��[6@��;G�\@��_q�S�@��&��@���OU�@��)N3@��2tYS�@�z�<xp@�q��2�@�m:���\@�l�f'`�@�p���9A@�xT|�?�@����ߌ�@��8�@��!%��@�����r@��e"s&@�y�J��@�
4���@����W\@�/y#��@�ď��up@�[6���@��h2Pf�@��q$	@�(W�W��        ?q�N�Nߌ?�
ė��S?�:�\��_?�kfFd?�mM�vE�?�!�?�/w��@�����G@
)�S�m@����2@���Zn�@���}@�ǝ�O�@"C����@%(%T�9@(puf�0i@+���"I�@/�����Z@1���.L@4�U[M@6H��@8����"�@;/�N4S�@=�o���s@@M�!U@A�T���G@CDI)��@D�z���@F~��p�r@H6�D��@I�݉؊@Kٮ�@λ@M��p�k@O�ǐ �@P�>W�O'@R� R'R@S"I�(�q@TLw�8Xj@U��H�@V���b�@X���H7@Yb�����@Z����@\.jK8�@]�WNh�[@_$ծQ@`W�Ǳ�@a"��'�d@a�NKm�@b�~�@c���>�@d��> ��@ed�<�@fM���D @g;���@h.����5@i&�Of&@j#�v�;@k%�@�C�@l,�qׂ�@m9F�)�@nJ��Za@oa*��ķ        ?S��[^��?��C�	�?�����DN?è?3�b�?Ӑ�^��?୽�n<?����{?�v�aw�?�:����@ ��R�R�@=w�0ۀ@
����G6@P���X\@��X�=�@�"�R@��d Ց@ Y�M� �@#�o�@%���8�@)*H��n�@,���@0G^��[]@2`�f��G@4��0I3@7�[��@9�b;BJ|@<��U�3@?���Ξ[@A|����V@C>$��l@EWr#
�@GP��^@I8�,vkS@Kw y0�@M֤cL@P,%�t�@Q~n����@R⎭.;�@TX�+��@U��h4�z@W}�kt�U@Y-�[.�Z@Z�jjY�@\����@^�����@`]���͐@akK��$@b����|�@c����Q@d�FO�w�@f�]� @gb���D@h�~iSb?@j��~(@k�Nw�@G@m[��@n�	B#&�@p�=�R@p�7uj��@q�Gf��@r�<s2�@s�E.�tG@t����/�        ?Kp��Ji?�#;��ڥ?�Uj����?���0�%a?���m�z?��GИ]?�M�+�*?�Wd~t<7?�#�hO[?�)�N�iM?����Y?�4>�*2�?�8���i�@���tm@vs&@����@`6��,�@I��I��@�F��2�@:��Q@O����@!ki�W��@#��D&S@&�A����@)���k�7@,���h�9@0D�,���@25p�cf@4O[V��~@6�`b�$@9�A�(@;����Y@>{�g~@@�����@B^�'�Yb@D	ԯ7�@E��,�`�@G���}y�@I�l� }	@L+��(i@N���5@Pz�5�+e@Q�#�n�@S"��9v�@T�A�g�@V � M@W��m?y�@YE�g���@Z��.Ԛc@\�gM��@^�\ܡ?@`AKz��{@a>oY4|�@bC�����@cQ�ˋ�@dg���o@e��؁Hl@f���<�@g��lE@i��!@jNy JԦ@k�N�n
�@l����6        ?Ԩ����@���2I@*;��?�@?���^D�@M�iR�@X��
�@@bK)z�|(@i�. W>@p�(T��@u�/l�a@{C!���n@��=�:s}@��G��@���b3Q@���fx@��w��0@�39B��c@���A��c@�C��ʓ@��5[
h@��	�+@�8�*VT@��7�³J@�q��}�u@�EB2Ч @�/�6�:<@�1�8�\@�K�B��@�|�jV��@��r�W)�@�}��Z(@�ROa2@���z<4@����?!$@�Y�p$�&@��7'���@�L�{��@��+�`��@�wͧ���@�"�Z1@�ۀ`���@��=/=�@���꼗#@­�-5l@åi���@Ĥ��1�)@Ū��J@ƷJ8�W@��� ��0@����Z�@����A"@�,���{@�Z��}ܪ@͏!)���@����	,@��bg�@Щ���'b@�P�U)D�@��M�7п@ҩ")��J@�ZE��r�@��+��?@�Ƌ{�`�        ?mN 2"�?��M3r7�?�T<"�o?�L-
�?�@�g\�3?�6�d5��?�O���?����G?��<�e@`���@�9�0q@��}g�@�L��D@��c�@�!��f�@y{2{�@?�Z�h]@!$V��#@#I�v�}�@%�ʫv@'���&L@*�be��y@--1��vL@/�[��)|@1se,"��@2��=B�@4�%�*,�@69ˌE9�@7�n�x��@9����x�@;�sZ��@=w�l�k@?n�?�@@��F��@A����O$@B��A��@C�A@E���@F@���9@Gq�Vu��@H�c���@I�M�&��@K4{Z�.j@L��1h@Mق7��@O5�]���@PK�u���@P��h�d@Q��}@RnK�+��@S(�@�i�@S�n��@T�K��@Ud�w��@V'�8�{H@V�Xv�@W���@X}����@YI���@Z�Ƅ�s@Z��,�2@[��2��@\���        ?H�tM�?t�]鷭?�Q����?��+�0r?�ȏu�O?����ZV?�A��&�?��$(*�?��&ÁU�?�w�t~�?�G�s�W3?��Q�f�?���a�?���A��?�h�l?�5�3J��@�q:�k@^[��c�@	&���:�@k�8g��@F`���@�h�a4�@�nd�@!�Q�x�@�j�h�@ �S���@#2�M�@%�Ԅ1�@(]І��@+P&�w�1@.����,�@1η��@2���@4�n3�ݙ@7-�G@9�"C�:*@<$
�f�(@>�##���@@��?��@B��x���@D:/5g@F�M�8@G��N�9�@J
��ެ@L;�6��,@N��gv>Z@P�Yg)`@@Q�.h�U�@S1�5�	�@T���葫@V-U��1@W�4����@Yy�^���@[?m�Iy�@]�_��@_�?��!@`���P@a�Ăz�@b�`���@c٥�.��@e�x���@fI�뉭�@g�İ��        ?llKIH��?��;�]?���FK�?�x�.���?��{��?���+�`T?����?�8k�E'?�c�$��?�@��0��@ ��Ğ�@��Ѓ �@�^bq�1@�P���@�"ù~@jo�<H@1s5&�@-�J�T_@`���y@̷K�1�@!��M�j8@#��L�J@%�+�%f�@'���.�@*Bpk��@,���@/VO
�\�@1��	F�@2�����"@4M�E�@5����Tq@7d��ѮA@93�A���@;����@=	��Ą@?5ZNO>U@@�<�g�p@Aݚu��@C2W��@DYu�u��@E��i�*B@G�s6�W@H�=; u@Jo�)?@K�8�y��@MKT�c�)@O�S�|I@Pk��<N�@Q^����@R\cP�mC@Se�:��@T{�G���@U�.��=@V͏�I�@X
#!�T3@YT"#�@Z��Ȱs@\!Ъ��@]�b=@��@_���#g@`J?��,\@a��rD\@a���B��        ?���~�u�@�X>�CT@!���kH;@4-����u@B�$~�A�@MѤ�$�(@U���m:�@^+���@c�8o\\i@iNR�k�@o_-\<��@s	UM��@v����V@z�6�+.@��Y�@��b��@�Md@�V@��#���@���� �@��{b�W@���cހ@��W��o@�M�,�|@�	�@� �$�ً@�����@�e�<�@�#��@�V�X>Ú@��1�y@����n��@�0>��2@�o.�d�=@��J��h�@����@�b�T��k@��"����@�2��5fk@����4�>@�&KJ�ǜ@����UsE@���kH�d@�kDyX@�;�9�dl@�[ꇤ�@��Ն��@�ģCDK@��ތܐ�@��.h-@�k&)�{�@�R̂�p@�=�y�@�)�d�@�<6mg�@�^D��6@� OIc�@��-p�Q�@���$�v@��?��Ai@�y` ���@�����:@��<���@��Wg�?        ?g+_fz6?��n��u?���qE@?��v��<?܈��;i?�`[/y�a?�f��O�?�>�d��@ ��@��T��@	��j&��@=�/��@�h���@��;�ю@��l.��@P��qS*@ �}�@"՞���:@%Gs�M@'�?Lfr@*�FX�@,�B�8�@/�c>�Ke@1@�zC�}@2��Ty��@4j�^X'#@6B:C�@7�x&33G@9�����@;���9��@=�|�S�R@?�pY��@@���t�@Bu�Mq:@C'Ձ�7[@DW���y@E�]��;�@FӦ�/��@H!	�:�@Ix�ӷ��@J�c�ߚ@LF�LzfF@M����@O=�R���@Pd�VC�@Q/N���l@Q� r��%@R���[@S���2�C@T�3S
ʾ@Uo��ޥ^@VW�w�!@WD�3��@X6�6��B@Y-�f<$@Z*'� p�@[,��Ͱ�@\5k�yS@]D��y'@^Y�~ۡ(@_v~p��@`MB&��@`�0j~G        ?UH �/�?���߯f�?����?���hx��?�Te��~?�m����?��_��A?�6&��e?�����~�@ r��@iYߎ�@	��"S@�e�iF@�����@���Z��@Aڶ,�h@���>m@���$.{@!��;��@$=�~���@&��nY�^@)\-2�Y7@,5Ƚ'H&@/B��a�[@1B���y�@2�����[@4�0��+g@6��h���@8�w��@;I���@=TI�nE@?�7l
u�@A#�nn@Bx���a@C�X��o@EP��E��@F�o���@Hj�ţ�c@Js$g&@K�O�k�@M��b��A@Oi|�V�@P����Č@Q�2�$'v@R����@S��/'�@T�Z\c2�@V	jG�N@W:���@Xu��ٍ@Y���>\�@[��f@\h3����@]��
/�@_@���@`^�dN�@a#Ǖ��@a�9Hʗ@b�^z�V�@c��Q� c@dp9�-��@eS:`ӯ@f<����G        ?Q�Y;!V?�bNMG�Y?��K���?��9�ݡ?ò�9 !�?�Q!�W0?؟ ��N ?�k� ���?狢q)?��~K�Z�?��kR*?�m�]pO�?�����3�@(܀�* @�Ӱv�@	���\|@Rt�7��@�Nyܻ@����0@����;�@#3��@��2�;�@!���lM@#ƥ�k�i@&?�U��@(��P��@+���� �@/ J�1�@12�OC�@3%�=@4���q:@7d�)#�@9Q�@�@;��6TȎ@>>O�Egc@@w��0@A�YX @Ceo	���@D�4.c7@F��7{�}@He�]W@J:��G�+@L$�
G�@N$�J�&�@P&���@Q2�P��@RS i�<�@S~�nKH�@T��ơ�@U�LM��@WB��;�:@X��Y��@Y�)�y��@[iR=-�\@\�g� ��@^dm�x-@_�on��@`ž�}��@a�ؖUj�@bo��f@cM�/O@d0f³=%@e���J        ?�*�jgK�@���D@'zj�k�@=?���\@LE<H>�R@WfW%���@a}[��K�@h\ߑm<v@p!�yoL@t�����@yz;�y�@~٬�z�@�V���@�y��އ�@��Ez�6�@�iP~�H@���u�}@��[A~�@�=�#�!@�y��&�@���@�LW�@���W���@�K쯀��@���>(�#@�.��W'�@��	�,L@�N��jG�@����2��@����ׄ
@�p�����@�D�K���@�'�U��@����7b@��s�i@��Vy�
�@��'o|~C@��ܵ���@��w����@��z�m�@������@�N�`�3@���u@��PHJ#=@�	���щ@�VT\�@����v�@�������@�0(��C@��m+�ȶ@����s@�O����@�
�QP�@��ҧK �@Ŋ�t@�P�
�@�����e@���rL@Ⱥ��'��@ɒth<#�@�omjX�c@�Q��@��@�9hj��        ?�t�&n�T?�Z��Q�2?Դ6���9?�zִ�C?�a�w�D�@�H��M@�1�Oo@1a2�j@�K�u��@�f�Ҵ@!�*�$�@%������@)�XZ�~@.��=Y��@1Ł:?��@4q�}j��@7ON�ғ�@:^�/$�@=��~�
@@���wu�@Bc��i�)@DU�\SB�@Fd �i�@H���)�@Jէ/t0@M9���_@O�G�{�@Q-�3�]=@R�=��1�@S�ŝ&�@U�=���@Wa7隣@X�mQ#K�@Zxu
5�@\Fƴnv!@^(�p��@`� �@aN�;#@b%��`�@c@tG�M?@df%��^I@e��6�-�@f���@�V@h�u�~@ih	���{@j���OK@l(��:'�@m��e!��@o�o�y@pL�@�@q�gQ�@q�LB8B�@r�`���@s���Fq�@tl���@uO�l%��@v8�.N�@w'�1�|@xH��@yĈ �~@z� ��@{�T4"�@|#�4A(        ?Vsܤe�?����8?��Ql?�3�/�F�?�g'�{�5?سp�	}?�K���?�u�[�?�����,�?��Jc|u?�~�ɹT�@ �}O��n@����@�M��|�@N�Q�@7A$�M(@��`�@6���@��q`@�:M���@!Yu�d�@#��Cn @&$<FV��@(�����6@+х�w�@/W�:k@1=oX+�@3��u�@5��vH@7D��*?�@9�K�w�@<�n�i�@>��ש�-@@��3c@B?��#�@CדGxc�@E�,d{8@GU?C���@I<�j ��@K@ ���.@M`,���@O�D��j_@P�!^}@R8�h���@S��CB�)@T���4i@VL{��@Wȿ�b�@YU���@Z�½�3�@\��X� @^c�
�B�@`*�(��@aN&"h�@b`���@cb+k̇@dK�
�c@e/�~3�@fM�F�{@gt�W���@h�ڌ��k@i�nPG :@k�Ő��        ?rxA>��?�A�K�+�?�WW��?�)����?�U)�d{?�
uٶ.�?���ZM�b@�6�)jx@��P/�@����@�^`���@��H�@!��'w1@$f�� �@(�F�_�@,7u.h�@0\����@2�O���e@5��Yy�u@8w<�0@;�Ś�;@?!�I��@Aq��4�*@Cx�e�*�@E���Ho�@H&���X@J���@M<}��@P�Ʉ}&@Q�����x@SWi+}�|@U/b�&�@W/r���@YYVӂ�@[�T���'@^/m�Ҋ+@`n�����@a�.D�-@c`�O�@d�d׶@f���r(w@h{����@j`q�G@l]:X��@nsLs�@@pQ5�+]�@qu^�Ō@r�:��@s��0��8@u.�#@v�/
�u�@w���X@y]e�?��@z�=j�?�@|jƁ>��@~&�̙�@��t�F@��}VQ�@��Z�k�@��k�U@�q��\��@�j{y���@�j�UFC        ?�.���@"v��
j@?�J�Z��@R[�N�k@`��LU@k�T�A�@sͻz��@{E��I˱@����qY@�����@�B�`�@�!.�'o@�i�� @����?��@�ԨgeM"@�����@�4�"jA@�����"
@���CS�@��d�#�@���uF�0@����*e@�yO0�@�.	�o�@���`�t@����C�@��+#�z�@���]�0@�'�*�Y�@�u��H.�@��O7 @�6"��g5@Ë-��<@����n�@�d�I�g@�韋�Q�@���|f+@�&���@�߈GK{@ΪcauZ@�CħV�d@�;��~��@�<���A@�G*Յ)�@�Z�(��|@�x�qQ@֞c�b�f@��	����@��BQ��@�I=�t�@۔��a��@���]h�@�H3 �iM@߯�c��@�������@�M�jv��@�юf�@��\&���@�ui�V9@�q�pJq@�Epܪ+@����/@��j����        ?�>Daϐ�?��Y&�_>?�+��?�)i�(=?�F�F�@�T����@�]蒓�@=ǈ+P@r�(���@ ���M�@$���)��@(�)yƊ�@-��ow@1D1���@3�y��p@6ʖ���@9�n��?�@<�L�̌W@@)�	�^�@A�����@C�"/l�a@E�WL�t@G�<۵v@I��U>A�@K��e�t@N	�F~��@P(�l@QVB�g�@R�Вx��@S�s�-��@U�+;i@Vf��4_@W��~�3$@Y#��[��@Z�.�Dn@\ً2��@]~���|�@_k*Z��@`G5Ȅ�@a���^#@a��"�@b�9��B@c���J�@d\d#���@e83�'��@fR���@f��޼�@g�ک��X@h��k�@i���@j�2@�'�@k�%!K��@l������@mv��N�@nm�P��@og���@p2(�J�@p��-T`�@q2z�O�@q��?ڼ!@r7��k�@r�����@sBu��G        ?I�/a�ړ?��3�4�?��A=�5�?�
��Ze?�DcD�.�?ҋ	�1�?�kNB�<?��·��	?�G׋&�?�c��?(?�
�h�=?�[��V�@ �� �vS@DB$y�@�)bq~�@�B\��@]j7�@�]�I-@�(��S@�AX&��@4��	�@ߛ��(@!��X
�h@$�oj7{@&l��$�]@(��1r@+��^��R@.��X;��@0�(;�A@@2��@��@4U.M���@6>ֳ��u@8G̍��@:pܠ(�@<���@��@?&� �<@@٘K�q@B1N��u�@C�8+�@ERV�v@F��)�6�@H;�'K�@I褭;��@K�*c�K�@Mt�(�@OR(���>@P�+#��)@Q�DO�@R�`��`!@S����C@T���d}�@U�怸5@W�՝�F@XE�h�J�@Y�퍷@Z�kM!=@\�yckg@]g���B@^ɑ���B@`׉@%s@`�L<��@a�H���D@b]�{9%        ?r?0�ѳ�?�����a�?��P��mU?ќ�t�[�?߅��V�?�vRb,�?��4�݆?�=EG���?��4���s@��@�2	���@:�L�*@�Tl���@4
{��%@��k,@��J�"�@ ���d�@"��>�@%�R���@(Y��N��@+h�a�\F@.��cP�@1#;r�g�@3��,@5��s��@7J\��@9��**�@<O��D�@>�^�0e;@@Ãa,�@B<����@C�n����@Emt��zI@G&"WCP�@H��e껨@J�FE��T@L֪v2L�@Nꎸ�.@P�4��Φ@Q�ZT]-@R������@Tg9���@U_���	�@V�`�C@X'9�q�@Y��	��@[�8׀@\�,Qe^@^>\y��@_��lhv�@`��.~K@a�p��e@b�N�xS@c��ZhnW@d�0�&�@e�^�h��@f���@g�n��~�@i����@jAtb��@k|1e�!@l��	��@n"�        ?�9έ�@@!U�]l!�@=�z���@P�}��M)@^�����@g��Ϛں@q���w�@w5bΈ�@~=��B_@�g}2�@�j�X}0@�,W�`A�@��~�ͽ@�j�kHݽ@�[M�x�F@�x���Kf@�����@��j�5@�麈���@��d@���@�Ō�`@��"E�@��F+��@�'.68�@�o�
wB�@�e�eXx@��ب�&@�߇�#s@�*�"�!@��Ȓ�@�ޏq���@�F�� !�@��k��r@�3��6�@��,��@�F*:�b@�݂��G�@��)��@���p�@�m�,�l"@�K��v�L@�.$�V��@���i3@� C�\~@��Y^n�@���l�7k@��!�@]@����T��@��F�g|�@����G��@�ٳ��G�@��i:A@��qqXGe@��G�]u@Ѕ���@�@�e�1��@њ����=@�'����=@ҵ�x2@�E�3�k�@��"��@�j�%4�@��n�z�E        ?]+h$&�?�{����?�y�����?�冊���?�����-?�ŏōJ'?��ܕ�qG?��&�c?��˚��?���'t�@ ���@0�e�!@�h�h@F꺖G�@e���{@ϝ����@`�<�@���@��0K�@���`@ �����?@"9��s@#�ھ��l@%� [��@'��,X��@)��%���@+�	�Rt�@-����@/��c���@0������@2T�=/�@3Gs�KTV@4z�^�_@5��,T�@6���]�y@8F�=k�@9�he�1@:�}�\��@<\)+��@=�6�FE�@?>��	�k@@^�:;!@A"��@A�E]��@B�yXO�@C�bn��@D\Ӿ��@E6�S�k�@F{�'ч@F��'�"@G��vܢ�@H�cw�@I��G�U�@J��)�#@K���̆@L�_s@M��@˙
@N�S� *�@O�oo��@Pi��Z@P�V���@Q���ӄd@R��8��        ?L�$���l?��z(K� ?�m�R�_�?��a�p� ?�B�!�?����qF?ڥ�#��?�cg�Q��?�8���?��
��?����Gh?�Af��Fp?���mp@ t���\@A̤�Կ@X�S[B@	� �>ل@�N/@�4@���bq'@YS�	@�al�F@LqJ�J�@H�:A
@��r-�@!z��@"��Z�@%3�4��@'Y��fM@)�d��Vz@,y����@/X��dۈ@17��Aѥ@2�."h�@4��u��@6��]�e@8��"�^@:��bi9#@=:����@?x��ħ@A���l@Bd�%H]@Cְ[@�@E]��?@F�U��@H�\���@JwvB)@LYRN�'@NS�M��@P3�2���@QJoӊ�@Rn�+���@S�u�Ͱ$@T�Oms��@V.n
�M@W����@X�v��[Z@Zp�FUq�@[�d{�]i@]�Z���@_;�í2@`z ��?@a^I*���@bJ��)3�        ?D֝�"��?u��p���?���j�h?��갍*?�CDe�?�)H�O%~?���-
?���NcX*?�ʁ��)y?�W��xy?鑏"_w?���$�?�_ ��?���Oip?�F�!բ�@ ��(�w�@��
���@�x���@
���"��@�L��~@��E�v@���@�����^@�7���<@�d�|�@ 6Yx~�@"f��@$#��8 @&T�EŨ@(�u�R��@+7���P @-�rv�<e@0h_x<>5@1�V����@3�:/�S�@5X4���@74}�pN�@9.V<|��@;G���@=���� @?� (;!8@A+w�C@B{�2*��@C�@>���@EU��u_@F��Y}@@H�Ă��o@J6D�Ik�@L ɌX@M�
�ۮ�@O߭vc@P�U�3�@RR�.F�@S2��O�@Ta����T@U�G�|��@V�KH$@XC[s" �@Y��sw@[! 2b]@\�M OT@^;���e@_�Ők�        ?����>�?�kA�y@EFj+S�@*���E�@9�t�=NR@D�G�ȡ�@N���.@U=��X@[������@a��
�%@e�h�Z��@j�LJ�@oy�\;�7@rg���/@u@7��W@xG\��I�@{{{*��@~ۍڲ��@�3K�y��@��Jx�@����+�"@� i�r'g@��tO�@�CA�2G|@��[^ �@���-(A@��u�D�@�Zn�2B�@���&W?�@���6*�@�I��^@��(li	�@���A��@���k��o@���u@�����@���M̃@�YU#6l@�(b�@�a@��ץ���@�Ӄ�y�w@��tE}�@���z�>@�tX���@�]fa*['@�J�&L�@�=E-\@�3��9��@�/,���m@�/\��K�@�4J r��@�=�B�@�L,�/��@�_�ϳ@�;>�.��@��7�Vy�@�Yb��@�뮻�\@�����>@�x��D@�����@�I??s3U@���>��        ?d�>��?��8%�M?�V8v��?ɪ�=�c?�J}2?�ߓ���?�+��r?���L5��?�]G�F2A@��*��U@�b���6@
��ūq�@�\�٤@����n@��8{@B�a��n@���b�@ X��+>@"d�%���@$��)0p~@&�:LIb@)QT�H�@+�c�Y�v@.�\q��@0���}��@28��So�@3ɵΏ2�@5mb���@7#���ۨ@8��W�U�@:�M9��@<�FΖ�@>�-~��@@m@w�w@A�)4*A@B�mݒu@C�"��f@EV����@FH���@@G�*P*�@H�a��d�@JG3�wV�@K�'3[2@M��y��@N����QJ@P	0 ��@P���M�Q@Q���u�@Rl�T�@S@p|�*�@T�s���@T�����@U�"D�A�@V��kdW�@W���'۰@X�ap��@Y��q��@Z��=yJK@[������@\�����3@]����P@^��=KC)@_�e�kD9        ?>�*����?xn�e�?�yO�E0�?�� h�?�?�J�_�?ϥ�i�?��Ge��?�Cx�D�R?�i+�rMl?��<[�?�,/w�\?��S��X@p!��K@W����@	��� �@�^5�/d@rLF@.��.̫@���)�@=rmC@ !���k@"P�C=Z�@$�g#��@'9�o��@)�$q��@,���H\�@0.q�@1�4�]�r@3��i�@5m���a@7xr��H�@9���#�@;�SLC@>g��t@@�;����@A��c�O�@CU���@D��R�F�@F���E
Y@H:z�v�@J(���.@K����te@M��K{Qs@P�BV6�@Q)_7��@RUT� �J@S�H���@T���;"@V5K���@W�w�LD�@Y�2:H�@Z�-P)O@\K�����@]�1zv��@_�<�=�@`ЦcT��@a�ti+��@b�ʣ�ê@c��$��@d���OD@f�|"�*@gB�*��@h}�Th�        ?X8�� Ц?�4�9�?�D����?����ft?ƾ,�jS�?�FhV�?���Ru�?♅K���?�C|�J?�O?��/��u?�;��$,V?�<���@g&�LY?@|86��@���Q@�&ʿ��@��=�@=�[�@|�f���@��Uve@��S�@���7@ :��@"I��rm@$��|�@&6ئ�l@(�yrH�@+	�;@��@-��:;��@0Ir�|�@1��D��@3m����@5%ҷB��@6�W�n��@8�����]@:� ��@=/OײK@?Z�p�@@� ��J�@B!YL�@Cuj�!�@D� ;��-@FYqyl��@G�|�>�@I�lk���@KQS5�]@@M%:�W�@O<�˟�@P�Ͷ�m�@Q�^G&+D@R����)^@S͏�y�+@T��^�-�@V8��@W�C�k�@X� "q@Z7\���@[��E��@]%�v��@^��͹za@`'#�Gj�@`�dE���        ?�>�@��K��m@ 7�a��@3`��&M@B2v��@M�#���=@U�Th� �@^:E�r>@c�W;J�@ir��~�d@o�6�B@s(��k��@v�"5^�@z�eF��s@3P����@��TJ@�m��/@������@��0�c@��8��}@�GES6@����$�F@��<����@�a豈�q@�VE���@�a��.YA@��׽Y[�@��2Ǩ@���d�H@�B�Iz�@��_�1��@��ؐ���@�49���S@���Z'/^@�0:�@����A�#@�-{��@�̇'K�@�y=� c�@��vE��@���(ဴ@����u>@�ԙ:R'@�ȪL��@��?,��@���3�'@��/\���@��{|��@���(3�z@��+cW�@�e�d�@�0~kX+F@�W���S�@����h�@�������@�x����*@��M�|n@���W�@�b0�	6�@��T!u@ùy �.�@�j[{�4�@���ۿ        ?z�եt4?�JhW��#?�s��i�?�A���W?�;�a(�5?�����?�Þ��N�@O����@U��y�z@X����@�W�	�@.5*��@+.a�|@xbX�p@!	��&�1@#}���@&p��B_@(ӱ)�4�@+��/��@.����[q@0���@2�Y���@4O�6�G%@6t�6��@7�g���_@9摍3�n@;���3h'@=�次@@�Q�G@A+���@BN�1J�@C{4S���@D��k@E��Χ@G20D [0@H�,?��@I�>p���@K2��H��@L�ӫn�<@N�60�@O|�l���@P}��^Ǔ@Q@�AX�@R!��x�@RӁ���-@S��"�u�@Tvh��_@UM�'�x@V)^-�@WЅ�l@W�<h��@XӣZ��?@Y�
Rz�@Z�vh�w@[��S�,�@\�zq��@]�$Ц�_@^��H"!@_���t�@`P����@`����_T@a_o��p@a���-�        ?Y���m�?��>�#�?���Tpe?��Ej�?Н?��&?���)@?�)���?� V�ҋ?�<��׻;?�6.!?�ɠWM�c@�C��4@�'�H��@��s	��@�/�gX@�'燢�@04����@���)N@�&)�X@��ܾ@Fk��Z@!r�#؎�@#d~$�@%x���r@'���{V�@*K��@,�a�O�@/OL�Ћ�@1D��'@2��0�C@4<��Ӽ�@5�j���J@7Ʀ���@9�q��H@;��>U�F@=�} �KV@@�.��@AKz���@B�$�;�@C�$��֧@ENx�/�@FȳعR>@HV�±S@I�t���@K�� ϋ;@Mz�Bک@O\�>B��@P��v�PE@Q�@���@R�t��;~@S�b�Jx�@UE
��@VQ�x�گ@W��9-�y@X�
��@ZW`� @[��	��5@]OA�ь�@^��G�@?@`B<_Z�@a$
�u�@a�1g���@b�n� �        ?j�s��?�����;�?����!L?�O3�l��?�]�}�Vo?�L5�I� ?��v);W2?�� �Pa?��:7_��?�!t��<j@�xa1�w@��Q�c@
.u�y�s@B2j�@t�8��O@��mbP@�Xf�@�Q>�,@ �j��l�@"��:S@%^D���@(ڟl�@+`<_@.(�� ��@0�?���@2�	�K�@4�FN$�
@6���l7@8�#�zQ@;+iT21@=���p��@@1@�`�M@A�h9Ty@C*O���W@D�S��@F���S\@Hf���C@J`6�@Lx�"j�@N���_�@P�����@Q�^�t|�@S姫]�@T"_��@U���8��@W�t�;��@Y1���>�@Z��ec@\��r�~^@^���Q@`eb6��&@a{�~�@b�:	��@c�Z�\�@e��μ�@ff�tT�{@g�o'Ǌ�@i:ih��l@j�އ�qZ@lP|�9�@m�]���@o��awe�@p��ֶ�        ?��:�-�@ )��@)���~�@=X)�0�@JԘ��Ɲ@Ud٬v�@_-�zYY�@eV�	�#@k�E�W.]@q�յ�k�@u��s��s@z"�4���@~����n@�-���j@����~�@���"&�@���#�1�@���xU~�@��@_Q@�tŒ�Ӝ@�Mn.�@�9���w{@�:��Ϣ@�P)�5�@�z���nO@�����Z@���	X@��zz
��@��:>7B@�B�JO%@��� �@��):���@�V�e
po@��ء~S�@�>7[e?O@����e�^@�J���P@������ @����}@��fE&V@�i`K��@�F	���w@�'f��n@�wF.0@��8+?"@��"�ڦ@�ۭԝ%h@��H!M�@��`$$#�@���b!@���aC=@��V�g��@��@74�H@����a@�����@��S��@�-�k;!I@����F@�VDZ@���l5.@È�ۉ�@�$���R'@������Z        ?x��C��S?����z�?ǜ���2e?�q�{�kJ?�NX탏?�NDjP�?��s�
�@�x;�K@ W��@C��	��@q2(Nh�@�W@)u)�@"Z銖=l@%\ma�s�@(������@,�e���@/����@1�B���F@3�ϒΎ�@65��3Ի@8�1�c��@;Q��@=�����@@<E�hN�@A��$SQ@C:n�"�@D�q�%��@F�<�U�@HJ��ب@J"JL�߭@L��*@N��:��@P��E�@Q)jx��@RJA���@Su�.#�@T�K3��R@U�.�PW@W;y�@X�^��kB@Y�}�x@[i��u��@\�����;@^p!K�gd@`�ei��@`��j�@a�y�Gg@b���!}�@cl��n̟@dVr���@eE�����@f;��@g6T �y@h7h�Fh@i>>�ȿ�@jJ�YzZ�@k]��L@lt�"w�t@m�]f��G@n�l�*�@o�L�_@p�eI�&        ?7<L/��?p�"z�0?����y(�?�V�"[�?���xK�l?�`�� U1?��+%��k?�������?ؽ OT�6?���H~�U?�D#�$�?�zyو=�?�Ey���?�jĚ� h?�?dQ)?�՜�@ߟ@!9�)�@͂�b�@
���r@��6m�W@�&��3�@�9��ܥ@�(|��@�[��ڋ@ ^<�v �@"���F�1@%2*�TF@'��횈@+
��yA@.c�a�r@1��Q=@3�x��@5+����@7��D�^@:	�ei�@<�+aNQ@?��k��@Aj=���!@Cy�`PJ@D� Hb6�@F�_�5��@H�wOs]�@K�c�c@MQu�E�Z@O��ԍ0@Q-�?�>@R��J�d@@S��`ŧ@U�$3�@W$�f2x!@X��Ļ�v@Z�pF�6@\��҈�@^�����J@`M�2�؈@af!���@b�z�dEs@c��/BV@ei��5�@fV��Ov�@g�A,���@i+�ց��@j�-�w        ?v�z��W?����芠?�
�Z���?���p�Y�?��!�3?�P0�t%?���0x�@�CwL��@
h����R@���sH8@T����@9Z�>�	@�Z�!�@"����@&C�4/�@)��K_�@.	�L{�@15��t�@3��Fd�@62D��c�@8�d�K�	@<~{�I�@?=�u��'@AZ�/(�@C5��g�@E0�D���@GL���@I�\��+�@K�A]�@Nr�?Ub@P��:�ƽ@Q��~	��@Sq���@U )µ�@V�����@XWZL�@Z cJE�@[���<=@]�zJO�@_���;�@a
���^z@b$Oeų@cI���@dy?�i�@e��`H<=@f���\@hN�U�\c@i�u��@kO�=t�@l�m��B�@n�XSm�@o��K>�@p��d�Y@qtf�e�-@rOl��#@s0�O<�k@t�-�S@u\�CR�@u���>��@v�j��5a@w��z
�@y�i���@zH�D7�        ?��E8y@oE��x@/I��j�@BB���%@P����@[��z��@c�_��i@kp&EH@r�	��@w|p�n@|��#^Z@�v�mwt@��6� �@��:`o3@���+�=@��y�+�T@��C�b	@�vWͽqr@�,�ڜ��@�Vl��@�$��t��@���n���@�o��47�@�D�t���@�4O��@�>Ȏ�a@�e���7�@��@�>Ł@�
T��܎@�Ĵ��
�@�z�ƣ�@�q�<�J|@��XSf�@�\�Ķ�@��0;PJ@��\��G�@�3�]q�@��޼@���4��^@�M"�4�@�DH��Pc@�C��w'�@�L]��U�@�]��D�=@�w�|�b@ƚ�ڕc�@�ƚ7P�k@��[�7%+@�8���_�@�~e?�-&@��Tk*bF@�"]>�:�@πa��7@�s#���@�)�O]��@�����@ңK-i�@�e��X��@�+�˲��@����K@���▨�@֕��@�j�����        ?P%OH�r[?����By?�&���L�?���l�F�?���R?��9M�L�?�Y,:&Y�?�J��h1�?��2�M?���P��z?�� x3?�bp6?��@�T�?�(��t�@�6&_@��}�@�E��@	�P��m�@�0� �@# q��@�dEy�l@��`@��+-�@�P���@Q?�C@��W��@s�:�T@ ԗ{�b@"'��L��@#�I��d@$��B�@&p��|"@'�^�oc@)�����1@+3�v�/6@,�OX��T@.���U��@0:�%��,@1)�hCE_@2�ڎ@3vuÅ$@4"�����@5/ߢ��@6CQA�qK@7_.a���@8�ɢk�e@9�7�*	5@:�P�R@<٬�8�@=`+��+@>��ۥR,@?���Ȩ@@�:�x�@A_�Vy�@Bϊ�A�@BΓ�{e@C�@�
}9@DMĿ
��@E��3@E�$�$@F���5@Gx��o@HL�צ�        ?Q��d��&?y1�2<�p?�����?����?���+&�?����>N?�Ir�7%�?�MX�.�[?�<̃j�?۠���D?��)�?�:m��fz?��;#\?��{/�;?�l5���?��-�!>?�'I�)�#@5��H[�@.us4��@�c�@Aw@?����@hZ����@���C�@�K���@g�r��@�m[��d@�ڹI�W@ �c��+�@"�fg{@%,|ɃЮ@'����W�@*L�s+@-1k"IP�@0*v���@1ےC$@3��&=\@5�Y���0@7��� �@:K~H�@<k����f@>�m��TU@@����~�@BR�3��@C�[�1�i@E���U-@G<���s|@I_�@J�x2�6k@M�w�2�@O+`��@P�7�:�@Q�����@S�:)@Ti�{B\@U�E(e=�@W,6n�@X��C��@Z-I.\@[�z�Z'�@]nQ�v@_'�y.�@`y9��@af��Ns        ?J�U�ѣu?~�i�
�?�סY�o?��9�J�?�m���?�>9$f�?���L%�?��2v�,�?��wB��?��SR;?��I~��!?�����e?���},�@B8v �@�r�0�@&��M�G@0�9��@T���4�@��p|�@�����@���@�Qf)�@[dN�	@!��R��@#�Y��`�@&!V�K�@(�m)�8�@+R��Ģ�@.I6b�@0�`�?�@2z�*<�@4Y�,�t=@6](����@8�Crl@:�{x�$�@=UQz��@?�$���4@Ag�T`~^@B�ޏ9Ym@DdtH/@F.�;N�@G�o�&q�@I�ԑqh@K� ,��`@M�/�-p-@P	�/@��@Q.�����@RadW�=@S�.�-��@T�c�k�@VOLuB�@W�.WԢ/@Y8K�j@Z����q@\_;�G��@^
��Ŕ@_�8;�Eq@`�8<� @a��d(��@b��l�<f@c���f#@d�{՗;@e�/��9        ?�|���O�?쟖����@	����@�!I��@,;�+W�@7&D�j�@ABۤ���@HBzj�@P	V�^@T�0�<9@Y���?�@_XS'Qz @b�)��A�@f9�B�˸@i�1��@m�nnռ�@q(���.@s|]�o@u�B��@x��@{ogR�#@~i2H;7�@��Þ��@�n���p@�,V��is@��1˛�@��C<m�@��gb&g�@���bC�@�7٪�@�-���ڎ@�WNm�tg@���P]i@��C��R?@��,n�@�oH��0�@��b!b��@�A[�T�@��K���a@�CA�\��@��CMޮ@�uQ��@��7g@�k��E[@�MsA=1J@�5(䆑.@�"�.&�@���^�f@�����2@�8�@���+@�$[�dr�@�7D1�@�Pfi�\�@�o����@��@{�3@��}����@���#�@��H���`@�2|j�<@��c���@�v��oO�@���e�        ?�'C�|�?�?�~Q�?�̓��E?���XI?�2��=U@�O���	@(�H�M@3�����@ ���@�@%^��l>@*�ֲ4��@07�m=�4@3jKr�[@6��W�?A@:���ݻ�@>�
Dό:@A�c�n�S@C���@F=#��@H�U'N�+@KP� ��@NR�q��H@P����4@R.Lm�O�@S�%�Ԓ^@Ut�O��@W.�"�Um@X�M�p?3@Z�u4�@\�3��	�@^�����@`_ʊ�t�@al:��2u@b��.�@c�0�ւ�@d��+�t@e�r��9@g##��@h_�����@i��:$@j������@lC�j9�@m�����@o��I@p6a�0�@p�f�Q@q����a�@rm�"�@s2Bx9V�@s���cI�@t�enN�C@u��q��@vk�hbM�@wC�Cz��@x��o��@x�r�)��@y��AJ�5@z���-J�@{���e�z@|�%7WA@}�/�3@~�úOM~@��C.q>        ?��F�C��?�]�~��h?׵����?����l�~?�E��E@B��rB�@��v@�[��&�@�U�@#��j��@(t�*��@-�W��.@1�k���@5>פO�@8Պܤ�i@<��"�,@@t� ��@B�P�^�@E����@G����#@Jb��g�@MB�b�Sk@P%�O�$�@Q�H��@Sj�-W��@U+ݺ��@W���n@X�� �@Z�W@H��@\�U_��)@_ ��͘@`����<@a�>8�"@cc��@dCV��a(@e���9@f��@h6�ΰ@�@i�/8��@ka�4Q<@l���;��@n��N��@o��^���@p��Xҋt@qv��NR�@rQ��T��@s3 �LO@t���u#@uo`;�(@u���/�\@v������@w�,�N��@yo��O@@z���� @{&�؎�@|C�=R$�@}h]��)�@~�JՅR@�ϑ��@���n��\@�#!�w��@��I@�r�ȇxT        ?{��� u?�F/O�ԣ?�C�f	^�?ݓ#P��?�`����C?��Ϣi��@ ��t�@(��;��@�`!5�@��B�}@�Ԃ�@�͹u"1@ ��I�T�@#�n�zJf@&�U��{�@*gc����@.E��"�@1<\��@3�z����@5��"���@8��M�(�@;w��&�_@>���ϷS@@痭k^(@B�fK��@D�4'(k@F��v�@H���:��@J��^x�@MB�Jn��@OǬ����@Q8����@R�F�8�@T��=VF@U�d�b��@WO�S}T@Y
ZT�@Z�扵�.@\�:�2@^��D�P@`h+��@a~2X�M@b��y+"@c�^"���@e$�e@fM=d8b@g���.��@h����@jj���@k��y��{@mi�b�Z@n�o��n@pOI��@q&Ƹ�#�@rGN&�^@r��0�%@s׋q�Q@t�Y�6+l@u�A~��@v�:,��@w�=�7(a@x�I/��q@y�`���        ?�Km�@0I���@N`��I@a�9N�߻@p�7,�N@z٦��q@���+ ��@��a@��y@��6FA�@�aq�U�k@����{2@��1.�@��EXW!�@�����@���h=�K@�������@�E���@�fYpw��@�����v�@����G�@�m��5��@����2�@�����@�1@�C@��@� 6K@Ŝ8"�9@�-4���]@���MӼ�@�r,g��@�%�;�1|@��,���@ϯ�	wվ@���Fv�@ѳ���r`@Ҫ�y
Kq@ӧJ=q�@ԩ),
�@հ�u�4@־C��ʻ@��$���@����"-@�]�R�L@�*�?�gc@�Sma^YD@݁��\ŕ@޵CWwz�@��G�L@��Q�츗@�8"6��@�܋����@⃁�b�@�,��.n@���U�9�@�<ȿn�@�7���f@���_��@�`� ��@�X����@����@���
�@�4��N@�L�2�        ?ox�ˌq�?�o�HhC?�E�)*r�?��!j2<?���^��?�� ���2?��+Ӭ@u���<@2��q�a@��v�@�8�W��@�ƍ��P@*�H��@ B�L@"�=pm?@%�V����@(�?��Cx@+�?y@/��^�a@1��"��@3����@5��"l�@8
�ɰ'�@:m����\@<��@?�����r@A5�*���@B���X�@D?ܭ��@E�SbK@G�S"��@Im�Cf�"@KS:��y@MNK��^@O^|���@P�9�m@Q����@S��y��@T<v2q("@U{u��J@V�����6@XG#�@Y~��Ձ@Z�/Dg]�@\h���@]�s�Ga�@_�)=�@`���Տ�@ag|F.@bCBm��\@c$���\�@d�?��@d����� @e��\�3@f�3��@g�)_l�@h�4�j�Y@i��3Y-�@j���(�@l��`3�@m)	-��@nI& ŎU@ooLpda�        ?LT��r9
?�(\r��?����y�?��]Xh/?ƷO� P^?ҧbz��+?����hU>?�?�81?�1X����?����>�<?�f��9Pb?�v#��̬@ 0t��@Q���@�t�vl @
�J%��@pg:�@3V�̵R@�D$E@�T���@B�l�y@�\J��@!ho���s@#�ۍ8aE@%ߛb1D@(cnW��@+��Am@.��t�@0����
?@2D[^�@4���B@5���$`@8*�j��@:=v��e@<� 4��@?	m��@@���=��@B6�T?�@C��&��*@E9��C��@Fێ���T@H�ųL(@JcĦ�!@LJ?t��@NI}9�@P0�lq�>@QIЋb@Ro�pL�E@S���I�@T�w.Vh@V2F�xT@W��kp��@X��AZ�@Zr�B���@[��Z�s@]��n�l9@_8+�'��@`v�p�Q@aY�����@bD?Y7��@c7Ҽza@d2=jm�Q@e5�)I��        ?�Ƚ���=?�2�D[
?�����_?�Aػm�n?�%�V�_@�&�X֦@��ݘ��@�a�[?@�svw�@"�����@&:���@*�\���@/��nf�@2�e:E�#@5gʶT�@8|���@;�i��`�@?O��Q.o@A���@�@C�~�S��@E�-&0�@G��k�{@JJÎO^�@L�;;��@Ov���a@Q!BD�y@R��xt�r@T%Z���@U����_7@WyzUJ�@YB��OX@[ ���-3@]��a�@_���@`��Lr@a�bhBt@b���O@@d:s�@e]0�B@f��� �@hTdE�@irp?X�@j����@lqB��o@n�\qח@o�Γ��@p�!m�Y@q��}=�@ry�G��;@sk`�F��@ter_�@uf�����@vqv9�F�@w��*�[@x�rP��j@y�Bw&ŀ@z�-�7��@|*d���@}k/wu�@~�Cv@��zٓ3@�� ��Z@�h|�i#d        ?��`��}@�.#�@9ڧ*(�W@N��
]�p@\��F��@gAU%��@q���@w���P�@扽Y�@��nP��e@�ij��@����]q�@���`�@��~�,a�@��:[�i@�=>8�/@����@�i�m��@�|���L@��4f8�`@��;Ny@�offL�g@�@���@����[��@�F���@�Ąli��@�T���"@���k�6@��Z��3@��c����@�d
L$�k@�\�ƺ�@�ju����@��a�
�@���2U��@�w#�7@�7gsb	i@�q��@T�@ƶqm��n@��z�}0@�`':|�@�Ōw[��@�66~��l@Ͳ>�= @�9�%6��@�f6���@�50���g@�	�Ț�c@��g`�k�@��He�ܿ@Ԧ 	;@ՎԌ��@�|W)Ne�@�n����@�e��}��@�a�t��@�bG<�9@�g�&�|�@�r�ئ�@݂-;�x�@ޖ�D��@߰���@�h%J�        ?L�qi�</?0�4R�?�J����?��I(�?�A�}��?̝=:�C?ՃЂ���?�<��[F?�;A�Z�?��Z�X�?�^���?����?�-��,�?���x�'@ ��9�n@ri�u�@Pͦێb@	fB,>M@�fiY�@6��cN@�Wo]W{@�AQ��@@/�}�@D#l�1�@��p�[@�lsz@��Cq@!�ݨ
�@"��֚=�@#�~�-�@%|e2�ߝ@'�N��@(���%lk@*nҙb>�@,6��� 0@.�=mZ�@/�rQ�'�@0�m���L@1�}�sh�@3����@4�ͯ
�@5$�,�b�@6>移�@7^����U@8�ӧN�@9����@:�u2�Y@<�;�/@=K��X�E@>���}@?���դ@@�4�		Y@A5MY��@A�Hz�߳@B�.*D��@C?:~g�@C����}F@D��T�N�@Ec����;@F �u@o@F���Wm�@G����A@Hi�^�~�        ?�;�X?S��{1�?uq�� �?�w���n�?�@)m��?�s2i���?�'\obϳ?���u\D�?�>���?��"7�@p?�
��8?�ہ��Z?��/¹* ?�t���X?���>�?���QRaP?��1$�_?���Ng [?�K��@ @{b��@8"\���@�{ir:@
]��B@@�-�3��@�6�+x@M�t�@6����I@l4�/-�@�҅$Z@ �M8Cxz@#^��|@%L�6i�@'Ȫ6�n@*xLǱ	�@-^��W�@0>.$1@�@1�燺`�@3�S��}@5�|���@7�VkhT\@9��`��@<*��ڟ�@>�M�w7�@@�޴m_�@A�/�1��@Cf��5�@D�(��'@F~We�D�@H&��y��@I� a�x@K�O@M��Cw	@O����(I@P�3ͫiQ@Q�W�!�@R���I�@T�8Ź@UQ*֐�@V���3�@WՊϙz8@Y(�ϙ@Z�#�d3@[�1��j�        ?1o���?b���3�?�_&�v"�?�TfD�&?�+3��U�?��6B��9?���
�Mo?�.���1�?Ϋ�
��?�~Nwb�?ڮ�-�2?���gp?�Y<9R�?�hڿ��?�$���to?󇭶��?�i�?�ӣi�C�@ i>�>#�@83�?a\@[�S���@	ٷ2���@�XR��q@�M��v\@O��S�@�E��@�o-��@��1��@���?�@!&����@#�R�y�@%t!G��@'#�����@)h0�<��@+ѥU"�@.aJ�aӔ@0�b�Z�X@1���c�@3�.O�@5鎕Л@6�����@8�hk\2�@:�RC�@<��s"9@>�^����@@c]�"��@A��)��@B�*�ȍ�@C�z�|@EM8i�͈@F�ͨ��@H�/ͅ:@I�8V��@K$�zPN;@L�TF�@Nr��Ѿ@PhT��@Q����@Q�H��d@R�����@S�"�=@T��#��@V`=�̏        ?�T;\qA�?��`$?�Ί���@|�BK-@#wp�F@/��5T�@8����@@���Wj�@Fͻ}��@Mz)�8@R��J�@V�Bٺ�@[a�v���@`?98Z͇@c{�=@f�+�Z�@iP�����@l��4�Fu@pIp�T��@rJH��N�@tk�1(<u@v�$� 5@y����@{�0s��@~<;B��@����0��@��9j�(�@�~2��q@�A�+@�ͬ5@����K҃@�R��z��@�7�<ï(@�0�#B-@�i�e�W@�.����@�Fо�Zq@�hφً@��C��,{@���g�@��/���@�9V��B@�D�H@�˺o���@���h��@�wu0�@�֊<:�@�䔵<�@�Ӧwh��@����DN�@�H�g�r@�U��3q@��%���@��D]�<�@�Z�H��B@�'y��9<@���{�/@����:Y@���Ѓ��@�|E1{��@�Y�1��@�:��`�@���-        ?x��c�?�^D��,�?ȹQ��K?��P� 3�?��^5 +�?�Ƹ����@ ;q�nl@IRГ1@�@���*@��n}@�̽*��@�D�}��@!$G�͍@$6�߽@'��;.�H@+�/�w#@.�B�/�@1|G���@3�9�MѤ@5�Oe��.@8N`���@:�DWd�B@=t�ë~x@@�{ >�@A��'��@C	��=�@D�9��(�@F6Cd�@G�Xyއ�@I�7�_9@Kl����@MI
��/�@O5*5��@P���΂�@Q��4��@R�����a@S}��@T��a<�@V���Z@W4�m���@Xj���`l@Y��Cz��@Z�`��@\<`�b/@]�aK�8@^��F�@`*��(��@`�M)s�@a�����@bZ��[z@cv�{@c�����@d����U^@e|-�`J@fNL�+V�@g$=/']1@g��| �@h�o!`M@i���|r�@j�yo��@k��a�F%@lvIIV�@me�U-        ?p��j	�?�.'~���?ƳhS��?ڧ��#�?腚���?�Yk��?�mk�9x@iK�@	X�5IЫ@{�6b@���gbf@��..2A@(N�Je�@ v�v�̎@#	!���?@%˯�9I�@(�	�C�@+��Jk�@/D~���j@1l��r@3R���0@5UQ�\@@7v����@9� ����@<O��g@>����ߍ@@��-�"�@B.b��@Cv=b��j@D� �;%�@F�G*��@HHH2]��@J�@�@K�+�,�@M�.H��O@O�K�	��@P����F@R����d@S6Z��Q@Tg^�d�|@U��}���@V����@XFi���@Y����@[GYz)�@\�J�V�@^+@��{@_�D�큊@`���T��@a����@bx n�Z�@cb�Ѕ1�@dT|�Ie@eL�?�>�@fL�=��@gS���R�@hbZ��@iw�|�L�@j��0�@k�ƅ���@l�>���@nk_Ȃ@oQ� �        ?tu�{�?�-��]�?�e���W�?���$^��?�#X�h�?��s���?��KF��?�r�ȋ�@����@`nB��@��(�g@H�̟��@v�a�m@�@h��@�e)Ȍ�@��@7�@!��:@@$07�?t@&�ʡ7=@)/5I���@+�B0��@.�膱�d@0��S�/@2����o@4T�6j��@6+l6�΂@8L�`s@:+���H%@<X,�{�*@>��cmu@@��
S�@A�$�k�@C'�j`u
@D��`�@F��2�(@G�4 X�{@IO�{:�@KZ���@L�ۦ3��@Nӊ��9@Pm����@Q~s/�V@R��*�@S�{���(@Uz�+�@VJ����@W�[��O@Y	
B���@Zq��@@\t��@]�:8!d�@_E�z��@`�Z�:�@ae��o�@bUU��@cNw���J@dQ��>~�@e_ �d�@fw�t��@g�'B�Z@hȡ�Z�t@j��@kIhTQ,        ?��h:��@��(	�@8+����@K���f_t@Y�s��@d�l�sÙ@m� tl�@t���H�@z�C�E�@��6��@��|���@���X$�@�L+�-�L@���A�}@���@Ƶ�@�z�� @���	��@��Y�@���Q��@�����c�@�����n�@��݀K֘@����$@�ҏ�6F@���"C@�w���B@��p�E��@�9�S�Z@��%Uڢh@��#A�@�G|0lo�@��iG�@�/��V��@��E0�w@@�@��IU<@������@�z��kʬ@��2�@�m�Ta"I@�Mf�@-[@�1��f8�@����S@�	%�!�@����hS@��ZZ�@��'�_�e@��s�ߐ@����>%�@��=��@�>n5�]@�&�ߓ,�@�@
/ӕ@�^	k���@�@]g|8@��
�YJ�@�j
���@�Yo��@Ҝ�j9�
@�9р1R�@���[q	�@�zQ�=�@��k�$@�ú#3a�        ?n�u�]"?�\|�i�?�_B<�?�;�0?��!���?���Q��?��U�ع(@@h�VX@	��lЫ�@s��.@��Fi1u@'��@7�ضS�@!�=�3@$���h�@(æ{!#@+����@/O ��5�@1���Y��@3��{L��@5�{gt|�@84���~@:�F!^�y@=!��E_@?��v42F@A=��r=@B��	��@D��'q�@E���Q^I@G23n�5@H��K@Jz���͞@L2�.+�M@M�,��m�@O�:�=�%@P�ce��@Q�h���@R���ڸ@S��`�@T�ZD.'@U�{�w�@@W
n Ͼ[@X+@���@YRx�[f�@Z�h�<ĭ@[��>{N@\��X^��@^1U��n@_yk�5�@`dߞh@a�2��@a��;�@bn�*��@c#����n@c�V�)@d�6k�V	@eW����@f-]%�@f�#�[�,@g��7T
@h{=��q�@iMuD�&�@j#�?�M�        ?W����4?��Yf��?���=F�?�o��:�?�X��Az?�5n�?a?�ԍu�ͽ?�Z꘽g�?�-���/?����S�@���Eܿ@.�-��:@RO3Ɇ@�YC��@Ӕ�օ@22&�!@�1r�t@��#�]=@!���|%r@$.�"EO\@&�?1(4@)�-��x@,�B6e�@0 �1�I�@1���C�@3���W�@5��r�@8;��o@:�-���B@='�ʕO@?���ѩ�@AYa7��@B��N�]@Dq�H��@FE8���@G�����@I���D@K�a�
�@M��uˁ@O�p�t&�@Q���W�@R0��{$	@Sg����	@T��А�?@U�����@Wa]9Gb@X���[@ZQT�^@[�]�gu�@]|���zZ@_(��H�?@`q�}���@aV�-�il@bC/��g0@c7-�g��@d2�X�K�@e6
76#@fA�%�@gS�\�xX@hn�!0�@i�Zm�p@j�0nh�F@k�;2�"�        ?7Fa�t�?ge�-�f?�<�}�?�:x=Hs?��s*5G�?���?�?�T	�?�� ��?����?�2*��J�?�{���$4?��dX�?壺<"?�����?��
��=�?���ɣw�?��t�(�?�B��@���g��@XS���@	%�U^أ@o��f�@ mp�}@����E�@�;_(7�@5����@·��@ ��&�#@#�e4o@%v*�Z�Q@(*�"�@*�>���@-�u���@0����8�@2_i��J?@4E�[��-@6N���/|@8|"l�9R@:�\�wa�@=I�$��@?�A��D@A]��@B�[�{PS@DnK��@FJ�b(�@G��ŷ�K@I��+<y@K��M;m@M³Eۛ�@O��?#@Q�I��@RPM���g@S������@T�M��7�@VE��]��@W��gs@Y9�x��@Z���;@\p�67:@^&�Ɩ�@_�\~q@`䷏A�&@a��r�$	        ?�%��+�@U}��0?@&bE�DG@:�C)���@I[�T��@T�\�mSX@^��״R�@e,��m�@l#��@q�&s5�@ve'�`@{Oh���@�[v��A@�M�����@�}�q�@��ܢoS�@�������@���g��U@�̆0^S@��h�:H�@�?�w�Q%@����͕@�Y��@��2% �@��{Gr�@�
b�]@�����@����Z�)@��DҎ|1@�f��@��m-cr@�_��:�i@�
��@�֟�Q$y@�RG)*)�@�?���0%@�3r�t3@�-%X�*@�-]&	�	@�4�J��@�A(;�(i@�T�s=�U@�n>sj�@��&��_@��8�7�@��g_��o@��lw@�K$9״@���. 4@�gqXl��@�.掗�@��/��@�b+Sq�@�(ygn�@��6���<@�{��J�a@�5���@��*���@ƴ7z�@�x�Vڟ-@�A!���3@�vʅx@�ܯ�G�        ?s��|�?�)%=�3�?�P*o�Մ?�<k]��d?��d���X?���O?������@B#�+T�@	��XXm@d���@p�h�ho@�\i�@��6��@!�	�>�@$����Q�@'��8�)Z@*�rdP�n@.�<7u�@1(�k}��@3)VK%�@5G ܉��@7��Ǖ��@9ܬ߀�@<Uj�'H�@>�b�yM�@@�w)���@B>,"F@C��<e�y@EEϨ8�x@F���$u@H�7���@JJ�%�	@L�[�T@M��_h@O�$Tǽ@P3�`@Q�Qu+�@S�EZd@T�契^@U6ɏP�G@V[Bh;�=@W��AA@X�-����@Y��E�Xy@[6QE#�@\a+�"z@]�̂J��@_'���Su@`C]���@`��!S<�@a�f��;^@bg&��@c%�[-F�@c����@d��bna(@es���*@f?�3��@g�ފ��@g�~��$s@h��SkY�@i�8���@jm��C�_@kN?��        ?o��nu�?�lb��_?Ɲ��k?�Zs5���?��E���?����B@.��-'�@]��f�@ ;e�@��+C�@�k@@��^y��@#:�jP��@&ڈ$��@*�{��@/4�m���@1�����x@4�U�W��@7]Mq8T�@:a\���#@=�I�.f@@�e�~�U@BgN�l@Db���J�@F}f)�&�@H���	@KL��@M�����@P�!M�i@Q~��
1�@R�_��:�@Tz���l@V�]��7@W�3�F�@Y����c�@[Yhi7:a@]Db���w@_E4o���@`�L�Q�@aŧ�d�@b���VM@d��ق@eU1�O��@f�����@g�`�Mп@iY�äJP@j˿�n�@lK��X1@m�3�$�@ow�y*�@p�J(�&:@qn�����@rSh��7*@s@ ǉQ@t4s�z<�@u0���@v5hy�9@wB*C-C�@xWH�y8@yt䟸Q�@z�"�>8�@{�#-~W6@}H��l        ?q�����?���:�
?�@�M�Ф?�W���?�>2�i?�>��HJ2?�o�[8?�qL���@P��`�N@����rr@Ra�
��@c,=z|r@��8�B@��]z�@1f�ۡ"@!u�{ܠ�@$Ai��@&�K�e@)���I�@-5��E/�@0a���q@2I�K
�@@4TL).�@6�����@8�R���q@;Gd@� �@=�^f��@@Pk.��@A�&'�,�@CI���@D�Y�Vu�@F���@HO_pZі@J#N�@"X@L:Z.@N��`�r@PNM�F�@Q~1E	(@R:/n��@Sa+�^�@T��"5��@UϤ(�Z=@W[@XjU�P�R@Y��f�W�@[3	���@\�R���(@^+�����@_�V�j@`��,�@a�ݔ�c @b\�|0~@c?�1ސ@d*'~�~@e�0hV@f�|J��@g�NR@h#�:�R�@i6�[#�@jSK<"Ž@kyɼ*�@l����e@m�,ŷ        ?��"�)@�A!b��@6=��*�@J����U�@Y��n��@d�Y�1a@n�ANP @uh^Ⱥ=�@|J��ўo@�	�1�1n@�`Ǘ0x@�)w�e�@�1#OO@��W��9@�X���@�V�
S@��b?�>@�C8��`@�9���@�MMK	�@�}��}��@��ni#@�9l���@��&6*��@�6�w�@��(�@��iNk	@��	�"'@�$���|@���LH5�@�xi�ƌ3@�9T|o�@�	~F�G@���ƀ@�ka�ܕX@�i�a���@�n� >@�{"���l@Ď��@ŧ�^��@���Uϱ	@����Bi@�&���@�P_��@ˊ��� �@���K�@�aR��@�anSE|@�Z�ɕ2�@�=�t��@Ѹ����@�k��~]@�"J���@��x|.b�@ԗ|�,��@�VP�U@��`�>8@��G��{@ף[ZE�@�m��u�@�9rIb@�V i��@�ٹ�6��        ?M7��X՘?�9��Dj�?��A��H�?�x�o�N?Ʋ���O1?����)x?�s��[B?�
Wǝ(?���0ʥ�?�`·٘G?��!�bg?���[[�@ %�M6��@'#�ޚ�@j��p�@	�ސ/�@�4w2m�@�!/J�@
�N��@S�R~�@��s��~@K���@�H�0@ʛ��W�@!^���@"�F�U�@$�6E�0@&2�/��}@'�ɛҤc@)��}9�F@+�H6b��@-�Zl @/�~sI�b@0�	���@1�6��A�@3lS�:.@4G�FEWy@5~��ϖG@6���cΈ@8w��b�@9b=�@:Þ��}�@<0:���E@=���4]@?*����x@@\�ڴ�B@A)u%���@A����@B�= �e@C����ڝ@D��BV)@E}���@Fk�C���@G_���7$@HX�<S�@IW/7��@J[;A�@Kd̹->�@Ls�wB�@M��"W�@N��p�T@O�S���@Pt�ʏt        ?/^����?gŨzG��?��f���?���`��?�n�k�g?������4?��d�@C?��?��Uq�?ۿ�)�}�?�v�Ì/?�g-f?������?��F�5@�?��K��*4?�z��j��?��ld�W�@��D(@m� ��@
`�#�<'@���d}�@���K�@�����@�5��7X@^lm�@<0 ߣ@!���h�h@$I��M@&�	А5�@)���3��@,�w,w�@/�>"y)�@1�6t .�@3���d,�@5�W󙘆@8AĘG��@:�p�D%@=q� �[@@*k�q9O@A��!�t�@C^����@E$1|�fR@G	����@I���)@K0��}jJ@Mx^�w�@O�B]H'@Q:�Cez@R�x���@TRl�@U��B� @W+� _��@X�qϹ�@Z�{�S�'@\��|]��@^�3�`�@`UGu8}�@ap��*qI@b�����@cә#���@e0�~�q@ft��`�*@g��=1d        ?0���g?a�m��/3?��t5/��?�Iڧ�C�?�-��@?���"(l?����ښ?�s����j?��t�K� ?����3X�?�d<�s�?ࣥ%懈?��;�?��xrAwA?���i�?�K�U�q~?�3�'Nt	?��a���@ c�S��@IN���@���.�@
=�/���@^����@}S�$J!@�q1�%@�֧�C@��jc@z�/8�@ ����@"�\e3@$���1�'@'h{��D�@*�.\�@,�g@0q‘@1��m�!@3�{�Y`@5q��Mǥ@7�le�@9�0���@<K��	@>�,��]�@@��|ai�@B��d�@C�e?�a�@E0����@F����X@H��x�\@J��@L�½��@N�4��@Pb�u�5�@Q�ǒ@@R�LJ2@S�l���@U>O~�@V�mTk`\@W�(�� �@Yo�w�=�@Z���v�@\��#�
B@^J�@_�i����        ?�etW�[�?��A�b@t���ְ@Zr:���@'�po��S@3�>
��@=�r<��@E��n��@LE�^NQ@RFAw�U�@V�H0�h@\)�
��4@`�/}�*P@dQ�6@g���4m{@k4"G�@o)N��9@q�(����@s��d�@vVb9��@x�c>@{��R�J@~V\5��T@�����D�@�0S��@���6G>@��y�Q@�E���Z�@�ʫ��@�fj;υ@�	c���@�'H�|>�@���UJ��@��q�݄�@���^���@�5�zkـ@�{��N�n@���.��@�,ݡ�9�@��X&8�#@�Ù�ȴ@��^H���@�)d�x�@�����]@��RM]�@���qP��@����W�@�l�?��@�`�G7�@�[�=�*@�]�"�/�@�gi�4 �@�x �?y�@���%F;@���ޫ�z@�Ԙ�ȈN@�դ5�@�6\�
@�r@���$@�Z�n{�@� D�O�<@����:�@�V�r[[        ?xA���?��2{6�?����2�m?��ӉXU?�|��?��.��I�@=~�K�@�;��"@��w��j@��� @-�jv��@4yl��e@!Vu��	o@$J���J�@'v3Pp�@*����?@.o=��J�@1�0���@3��)'�@57���@7klv�@9�pC�D�@<!Ҙ-y�@>�͹c�@@�M��P@A����@Cg����@D߶N�f�@Fe��BA
@G�s$G:�@I��x0�c@KK���#@M
*�3@N֪Kh@PX��e@g@QL�#!�@RG�L�:�@SIR���@TQ���@U`J�kC�@VuaVo;@W��׻P�@X�<��Hl@Y�ʰ7�w@[D��>@\:�� }�@]s����@^�ZhC@_�'?�i@`��\���@aGB?"C�@a�RNڲ�@b��m�iZ@cM']A�a@c���(�@d�����@eiY�>��@f""�5��@f�:��im@g���`�@hZJ��)@i?~_v5@i�ya0�g        ?J3�m/(?������O?�{U��a?�nyے`�?˩KZ�l?��`'��?�Fk��Xd?�=�@��?�77�7�?��>���?�_���4@ BFQ��X@�MK���@����@@١z��@JI���@�)�o<�@�n���<@���e�@:T�щ@�[���@!�P�-@$[��A@&]#���>@(Ճ��)@+{Q�hZ@.PX2˝Y@0�(��@2Gr�]��@3�Ә6�@5����@7��_&f/@9���S�V@;�#H7,@>.�D�Ƕ@@H�%$��@A��3�v@B�u��@D=ӻ�L�@E���;V�@G7���@H��(DC+@J{��i�@@L;b�S�@N�T@O��B��@P�F׫�@R�G��@SNy�8@T?֋��@Um =*��@V��l8�b@W����@YC���@Z�ǬCh~@\Z��q�@]�2���@_�~��@`]*h��(@a2�Y�nD@b=�5}V@b��j7�@c���>�        ?m_�� �(?�99�mT�?�^A�L�	?Ϡ�3�D�?���kj?��I�"?�Տ�?�[�n���@���.0�@��\��@#7��n@���@�x��U�@Ǐf�@��r���@!��l�`@$�Yi ��@'���7�@+V��"n@.���?��@1;_϶�@3H=���y@5{�箟@7�0��y@:\M��@=D��ƈ@?��"�h@A{�ϟ��@C�����@D��hw@@F�`��9�@H��aIŦ@J�h��V@L�q��,�@N���C@P�Ϸ��@Q�(����@S,}�K7�@T�uY6h�@U�u�8g�@Wm�w9G?@X�?����@Z��)_��@\G\���@^	dMӴ@_�M�a/g@`�QR���@a߲�=z0@b��g�4�@c�D���@e����@f9�0���@gi�T��%@h���O	@i��7y3�@k:)m4�B@l�F[t�@m�f�C��@ol�ޫ�@@pt��;�)@q8����h@rNm�)�@r��m�\�        ?�m���V�@Y9B#�v@-���JMq@Au�!{O@P4�L��@Z�v&�@c�OӪ�@j9�/4�@q	��*�@u�2$��@z�d5���@�>ʑ(�@���h��@��@�@�x�?��@��/��@�rޥ5O@�v���\O@����@��lz��@� ��uU@���b�7@���@�Z���|{@���]7[�@�$k���@��[}Ih�@�#�Q�6l@��ѡ�B�@�Ypޫ��@���؉�@�ń(R�@�����X@�3�}���@�&sV��@��(�j2@��r.,�@�#5���@�.��V @�?�U���@�V��k�J@�s���н@����`@��b�@�����@� �Pa�@�Y�½�@��p�)�@�n>�_�@��:�Q�@��]��P@�dj#+W@��=0W@��L���)@�r
-�CI@�&;ւ@����I�@ƕ��R��@�P��x�G@�7:�{@���.��@ɏl�S��@�S6���        ?t�	�%9?���P3�?��|��?��M&p8�?���C(�?��^�@P-R}h7@
�`�M�@�)��#h@��]��@NR��ҍ@!:��0�@$�� ��D@(=����@,*J
�M@0.6�A�@2i\6���@4�ז��@7C�����@9��X�@<���H@?��*@A?T�+��@B΂�SD�@Dm?&��8@FV����@G؞��]@I���%@K�/{<j�@Mj?��m�@Oc	+���@P�<xԯ"@Q�G}*��@RҸ{b�@S��]�@UQ\z�@V7�I���@Wh�F0z�@X�y� �@Y��˨�@[*��x)�@\z�F<��@]�v�)@_3��O�@`NO�JD@a�	" @a�̵J�@b�}�+�I@cG�|�~�@d���z�@d�B>��O@e�#A��N@f�D�/��@g\�I+#c@h:�{��o@i�d�2�@j��\�@j�bm �@k���PC@lӦɌ� @m��+�}�@n���uz�@o������        ?k4b|A�%?��QV���?��J/�د?�Լ��w\?��AӦ�?��\!�?��XvmX@^�.�@]���.@��4�@�n�k.�@6��,3@�H���S@�9IS@�J�M�l@!��<��@$>9�Y@&��b��@)M1�_S@,����@/�te��@1�=I5-@2�B숚�@4��b�+@6^�X� @8Z0���@:s��{�	@<�#����@?/� �U@@���r@B���@CtQs��@D�@�c�@FtP�Ӡ@HR�K=�@I����Z@K��c�@MvT�{E�@Oql��/@P���PJ�@Q�ޠ~�L@R�[Y��@T0�G3lz@Uq�~�F�@V�,ۆ�h@X @�xO@Y�D�-
�@[��ɋC@\�8�an@^A6���@_�=���@`�柰�?@aʬ�)1�@b�$�S��@c�}\�R�@d��Ց��@e�r���@f�[��t@h(����@i\æhU�@j��q/��@k�H�q�@m:h�        ?b�Z5�?�m�V	 7?�6��i�?�s��e�t?�t��d�?��x�$�?��w�E7U?󠇯U��?�_�{6�c@A�@^�@�\lIW�@
��
��u@J��S�Q@�r��[�@+�@C0@/"��@��Y[�@">Gte@$�^��φ@'ӮT;�@+A5%;@.v��Ҹ@1����V@3'�g B�@5^���4 @7�ܝp�@:_w���@=.�'�t@@����@A�qN0��@C~��8��@E`dD�.@Gd�]'&@I��&1�@K��Zy�@NH����@Pq�{%�@Q�O����@SH�!5Np@Tա��@Vy#�0a�@X487��f@Z��?�@[�O���@]�	wۥ�@`^�KU@a-,Ia4d@bZd��~@c�~����@d���u�@f=HB��@g�Y|_�@i$	/@j�eEc�
@lM�;��@m�ǘ$Q�@o�⩩"�@p�i����@q��ˡ�@r�1��q@s��`���@t�C���@uǞ��^�        ?�O(��@��'@=���>`@QsIY�G�@`J��0�6@j4�zmQf@s*��+��@zL �<@�;h.���@��#��R�@��k���h@�:(�^��@�;�dX�@�vې�@���%�۰@��V�N��@����;G-@��8�	-}@�����@�5\Z`\@�^Zt�N�@���[��@�;Ye�%@�d�r��3@��s���'@�:���N@�w�}M&@��o4�ɷ@�`���x�@��?Q�9�@�oi) 8@���MX[@�����<@�Lo��Ё@�C��q,@�]7߿_f@�@&Rs�@�(!��{P@�E6�K@��h @Z@���$�@��!�oW�@� qɼAg@�	�BYU�@��-�7@�.4�Υ=@�I��#;b@�kjj���@Γw%�v@��준�5@�{q[�'@�9֝vQ@Ѻ^�wc�@�^�l}:�@����@Ӳ�{�}�@�b�rf�@�#r�mH@�� k�m'@ևr�
�@�F�7@�	)��@��tb�s        ?�z�u4?�àGIk?�V���?��(M`Q�@
+�鮸T@�I����@��@T@%D��Sh@+�jfh��@1�:N>x@5���Pt@:�xW*)8@?̒T^�E@B�5��j@E�M��+@Id��S@L�U9@S�@P�*��<@R�����@T.��+�@Va:���$@X��N:6(@[^q��@]��F�W�@`$��A�t@a��d�zC@b�!V���@dos�%ҧ@e��S��}@g�q��&,@i9a
���@j��o��@l�	#!@n�5@p4v��Z@q,�"���@r,�iv\@s4����8@tD*�~�@u[X�#�@vz=���Z@w��81M�@x�&��x@z �Ӓ@{B�E(�O@|�L٘@}��s0��@)u�~T-@�B�4_{;@�����J�@����S�@�d��H:-@�"�\�g�@��M�v@��ļΎ@�t����@�C>#��x@�����f@��%��\@���N��C@���D��@��y!Ġ�@�o�2Ս}        ?JP�FGU?�W��/?������?�߃�,k?�d�ܭ�)?�z�>��?����G�?�U���??��2�G?��@�Ǭ?�����c?�J�\pTx@ bYb��@�y�<�@`~���@:�� r�@\G�u��@s���&@�g���@�m��]{@ 
K�WE�@"i|vC��@%�
˒@'�o͓�s@*��Ɍ`�@.Xۡ�jV@0����f@2�='b��@5����@7Ae/��3@9�_���@<Ф�o�@>�����m@@��=F�@B7S�T�
@C��1!,@ET	�-�@F�~�Ԯ%@H�M�q��@J�d��@L]�w��@NJ��L�@P$/*jx@Q+؝P~@R9���n�@SO���&4@TmR���A@U���˚�@V��Nd2�@W�����m@Y$����Z@Zab���@[�[X��"@\�b��-@^6<E�~B@_���4��@`m�r,��@ae���@a�t˚�@byપ�t@c,��`d�@c�ئ���@d�,u�5�        ?���!%0?챧A�Έ@>>�p�@n����@(��x���@3�,��65@<���`l@C�I^�%?@I���
�/@P&]C�u@S㭰���@W�4���@\n;���@`�2]�i�@c,�.�'�@e趺�a@hϠ�t�@k�d	-@o_t��@qC%��1-@s��Y�@t��jLw�@v���ʢ@x�_�R'=@{�)>-:@}Aܯ��?@���l}�@����?\@�3Fd� 0@�y�M�(�@�����y@�&�ٔ@���\@���8^&�@�xx�7��@��u"a��@��e]<@�%+��n�@�c�Q�
t@�9�dhY�@��hĬ@��C�=�x@��l�R��@��)c�@��jAq��@��!H|�6@��@O���@������@��y��@��r���:@���H�i�@���RaL�@��۝I��@���|�C@�ݖ��pA@�{�.P�@�
짘��@���%��/@�-�G�EB@���$���@�W��V�@������@��*`'��        @nu�z��@J紭H�T@f�6UA�@y�/���@�J�ҫia@�n�n��@��E��}:@�9���@�ǖڧR@�0��a@�qĩY8@�3L�ƿ�@�CTC��2@���Vlڡ@��Mٞ��@�)�]&�@ƶ�f�Fe@�uFp�	@�VK�@�Y?��@�>�k�C�@���Y�@Ԕ��;=@�X9�gMK@�+����@�pI2^@�d�&�@��.�Y@���r@���_s@�8;�q�(@�Y���@���=�@�Ԇ�"D@��;O�]@�-&3i}�@�un���@��{~_6@�UDn`�@�}�ː@�����@�)�V���@��}/}i�@����n@�hT�f<�@�/��wc@���[�@���>�@���Cwa@�s��O� @�N��W�D@�.'��@��qM�@��?n1V@��|��7@���,��<@��/��0�@������@��;��N@���(��ZA ^N_qxA �鸝�AgZ�Հ�        ?m�5\�?��0� V:?����1�4?�YtH.`�?����?��]�X@�WO�@
U�����@kօT��@E���@���zhH@ ��g�H-@$6N���@'גs��&@+�=����@0��8U@2J�p��M@4�����@7SX�/�@:]�ڤ>@= �y��[@@
�N?@A���$+�@C\����@E#�g*�@F��_���@H�q4yRP@J� d}C@Me
U�@O.�ƈ�#@P��8�a@Q�]D6@S�IL�u@TLZz�Mi@U�ʸHlQ@V��3�%@X9V
�w5@Y���ug@[�g�
@\}d�&J+@]�(��,�@_��(R�@`�����@a[d
�@b.k�IC@c�� �@c�/J��@d��~qQA@e�>�@f��+y��@g�$�X*@hr�G��g@ij}���@jf����@kgr�$Ue@ll�򤅎@mwG$(\@n�]�c�_@o�H��3y@pY��y��@p�Y���h@qy�r�]�@rC���        ?l�z��?��-�7 �?������?�����?��,@u�2?��g9�&?��?j?���۽>$?��F���7@��4��@�~�@�:���@=��f��@al�c@ҫ"o�@�M���@�e�'z@"���@$w����t@'��*�@)݂����@,��8x4@0|V1v@1�=�OJ@3����9�@5���3�P@7��Y^-s@9��~���@<R��Iz�@>م�X(X@@Ø����@B.��&$@C��u�A@EE�w��@F��C�x@H�C��$�@J���;@L���%��@N�����@@Pa�}}��@Q���v�w@R�����@S��=��*@UD!��'@V����+�@X�[>�@Y�R P��@[!�4a�@\�y�Hw�@^c���@`���s�@`��H��h@a�l����@b驞�Tc@c��*��@e �+�@fy�ne@gCM)MS�@hu�wZ)<@i��d�@j�@zL�@lU*N�[@m��ߨq        ?r�tt�G�?�E����?�%E�7c?����<^�?�7�\#�?�8"���?���[l��?���#�]@�H8��@܏�fU�@�w4�� @����}q@xo�甍@O^�xUc@����t@![.�!@#�m�;�k@&1d7��@)Z�r�\@,:���9�@/���;��@1�%�99�@3�����@5��m/2e@7�v�4@:K;��;�@<� �ӿ�@?�3/���@A7̎�]u@B�D��q @Da/�@F�N@G� �x�X@I��B�@K�M�n�@N��5}@P'��qǋ@QW^$�@R�K�g��@S��7��@U=����@V�Jd��l@X"#+��@Y�E��z�@[C�Q�X@\��]�f@^��sU<@`5�cg�@a!̼�B@b� /5�@cX��@d�7��@ey,��@f2���}[@gN)K]X@hq�qYi@i��jz��@j��JM�@lq^��4@mS5��[�@n�[�:��@o��t�M@p��A�e        ?����f�@ (�fϊ#@<!�*��X@Pv;�@]=�.�m@gA�mKnP@p������@w4�AT@~i�����@�E�||V@��ڂī�@���B�u_@���i@�(�j�@�/��%fm@����L�@�-(�l�@�4b��
@��F�z�@�-	Wa�E@�m����@��H�@:�@�DukP�@������@��7�tD@�)"a;�C@�����C@��{�J>@���'?%�@�>jB�f'@�����@��'3\�@�T�Ļ�c@� ?���@�{�ʲQ@�m��0n@�e��Zc@�ci�B�@�gUqA
�@�qX.��e@ƁosQ��@Ǘ��S9m@ȳ�� t@��<�?ۘ@������@�)O��@�[o�Gm@Β�d-�C@��y���&@Ј����
@�,&�~�>@��;kP�@�z�����@�&#d�A@���I�l�@Ԅi��@�7y�ǩ@��/y�w�@֥��1�@�`���`
@�e��ͣ@���2�ϗ@١��f�)        ?S��f��?�f�L��?��Ä��?�6�-�P�?���33D?�� b�?�,��l?�̌�\�e?�^8�	Bj?�{����?�>MY�8f@R�	�@�ɬ�Z�@�_�Tq�@�'jW�@��m�n@qi�YZ@���oy@o�9U�y@T�yt@^�e%[@ �RX	�@"oj�ԃ�@$)�Rq�@%��okX@'�C��χ@)��_��@+�A����@-͠/A0�@/���~@1�8��@21�U�(@3]:D�@4�;�Rq�@5Ի-w@7"^�v8�@8|�L�@9�H��~5@;V���'@<�/d�r@>dz�%t@?�� "D@@�'uW�@A�^t"@B�/�O~q@Cu����!@DcD��c@EWKJ�Z@FQf�F�@GQ^M��@HV��\\@Ib h���@JrFH��{@K��Q��@L�a�o�@M�L���M@N�c6f�y@Pط�@P����O@Q6���J@Qѕ�*�@Rn���O@S����|        ?)#�ۿ�?cpR�/M?���r&�?�ѡ����?�N[��?��h:hr?�)�Yc��?�麁.�=?�Y�J�v?�ᧅ�4�?��ѩX�9?�x�-Wt?����::?�jno��?�;�I� ?�d��d�?�yѪ+�@:X?��&@9���@������@OmG��
@s�,aTR@��0x@���=�@L���?�@RP��.�@��@��@ ��.g@"��;��@$��t��@&� �{�t@)rP\:�@,�)��@.�u6�S@1"N�f@2�cF���@4n[���@6N��@8L���&@:k\�f�@<��d��@?6j�W�@@�q��5X@B���Q@C���G@EG˼�j@F�z@H:0d&y]@I���@�{@K�)ҬV@M�����@O�����@P��L��m@R	��9��@S4;a�F�@Tl��@U�����:@W�~E��@Xl�����@Y�.oz@[`����K@\��kxy�@^���"�(        ?d��Fm�?�ij�Й?�F�xG�:?�M$��DK?ضq'.3�?��{$�K?�O��)�?�f�%�?��+�v��@P���@����HI@lGa�qV@�~���@��No�@����P@�*T*\S@ x�vD��@"ɂ�q @%GT'K�@'󍖝Է@*Ϙ� �l@-�ٸ�̾@0�R^U��@2H����@4Y,�V�@6�4�FD@87Օ *@:<��i�@<����@>߸P�_c@@���pV@A���X�@CZE�O��@D�RY�@FGdn�^�@G��Dζ@Iz���@K0>��Tj@L���.�@N���@Pbrf�7@Qd��K�&@Rq����A@S��a���@T�v��s@U�җ1�@W�bp��@XZ��_��@Y�X��c$@[J�M��@\x�l}@]�.d�\�@_w�+gg@`�0.��@aW����@b0Z
��@c��SE@c�mY.��@d���m�@eߐ6�j@f�H}�b@g�IK1@h��"�z        ?�ƶR�e�?��
�b
@[�ug�@,,u����@;����Q@G/�1�@Qr��D@X�����M@`YC��^@d���9c@j,�.��q@o�>!ҋh@s3��-@vw�7�#@z��;��@~
����@�q�0@�Qx��ԑ@��H�C�u@��q㟈@��	,9^�@�Pg.`�v@�	��&�@�x1���4@����8sN@�z1B��@��sǾ@�������@�Y��L�@�<զ5+@��"=;@������r@�C���@�9�0�.B@�7�h�[@�=�����@�Kα�p@�`_:���@�}f�Wy@���e�@��W���@�>�C@�=V.�F�@��d7iv@�ɢ����@�kF\^@�9
.@�����@��X<�:�@�O��2�]@�ʂy�@��»a/@��ma�@�@�`I��@���9��@���U�ݧ@����6��@�Z�Ahur@�'pW	nJ@��aޮj@��Ґ�@��si���@�m��O�]        ?Y�H!�c?�VKv�
?��Y��??�hͣ��?ғn�Xt?ޜog�n�?��qa��?���A�Y?�O����?�_�L�(?@\ ں>@ݖF��@	L��s@�y��ӎ@3�^h"J@�CiZ]i@���hNN@�Yq5E�@�b|��@ ���@!�pb�[@#�?��l�@%��H�<@'�څ��*@*N�Vv@,l��m,@.�.H/q@0���� �@2U?�!�@3z��@4�ŗ��@6vjN2�)@8
�%-v�@9�uR
�@;^_�^ј@=@`		�@>�߼G}@@b���@AU��e&@BP �@CQ	Ru�@DXx�C�@Efh�I�^@Fz� �I�@G������@H�޵���@I�z{�V@Kv� ��@L@��w@M{���~@N���m7@P��gX�@P��Å��@QR��\H�@R L��@R����]@Sd�44�@T*#a@T��/E�@U���g�@VV�1?@W��1@W���[YF        ?P�y�m�a?��A���?���p��?�5��]@E?��Ϥ��?Ԍ��4�?ݯ�V��?�)�u�A)?�@��?��
���?�v�ϲzx?��l��7?���#��@�}z��@�|�Ϳ@塓Sy@�аA�@������@=u���@~���@,�)2C{@�L+OW@K�#q�@ b�����@"E�a ��@$QX��@&���
 S@(��;lm�@+v�y��%@.4�H~@0�`(a�[@2$�H>@3И����@5�#sp@7~ض�1%@9����)@;��6)@=�[E��@@*#�ǽ=@Ap'?~�@B��7-�G@D55�*K@E���c�i@GK���@H��Y3�@J��@L�@J�M@N��n�@PC���@QT;���@Rq��ϩ�@S����0Q@T���7V�@VS/Ĩ�@Wp o�i�@X�O��w�@ZE�h�Ij@[�%s��@]X"k��@^��3G@`T��z,�@a5��Qq�@b���K�        ?D�1+�L�?w�Sj9?�n/��?�FL�A�I?�~�<K�?�-]����?�ۥ
�4L?�� �5��?�K�k_��?�a!�?:�?�Ql���=?��F�|�?��4gEh?��Mw��x?���"��@B�C{.r@�z����@	99Vadk@W�bN�@�j�R�@��>��5@UFt#�@p����#@�{�'�@ L�����@"V����|@$�hmw#@&���� @)�']�5@,UL��U�@/R/��!@1B�r׿@2�~�gq�@4�'*&@6��>��@8����K@:錪��v@=2��s.@?���J�@A��B�@BhC�*�@C��Hj@EF�%��@F���R��@Hk���@Jv��k@K�D�u[�@M���k	�@O�:	8N@P�m4�5@Q�j�* 4@R�'����@S��M�U@U�	�@VDD(*]�@W{N?ɶ}@X�*M�}�@Z�oږ5@[[?l1C4@\�ip���@^!H�/�@_��w�ޢ@`�]�x        ?Ķ��j?�ep��@}t����@0�HX�@>p0��6@H�j�D��@RCj�O��@Y8�D�I@`�g�7@e�چ��@jӹA+�@o�B�O�0@r��x�C}@u�D@��@y]4��c�@}?�PM@�r��
@�� zz~@���^_��@���{�@�T���T@��4�n�}@�z�lJ�q@���9A�(@��yX�@��i��E^@�:v7o�S@��-<@����t@�way��@�Y/��@�K�X�Vk@�'�F{@�1+u�C�@�B����@�\ch��@�}!����@���-���@�մs��@��h­@�K�;��
@����oG�@��5�&�u@�3�U��@���^3��@��}���@��l 4�@�gݴ�@�#&���@��qT @���A{o@�l];�(i@�6]���@��P�Q-@����z�[@�����{K@�����@�]�$,�G@�=���@�!!2�Ia@���?�;@����9)@��,0t7        ?y�?#x��?�z���?�`�pѰ?ޝ�d�?�P�3�?��{괤�@��*{a�@	����@�c���@��q�x�@2FO\4@ �,�Shu@$P(��@(E�;O%@,��Y1T@0��:��@3S��QP~@6'�qM�`@94���f@<{�3��@?��^?7@A���}�@C�T�b�@F)T~߃@HC��n�y@J�=�@}@M.:5E[@OՄ�c��@QN�����@RÛ~-��@TH��r}@U������@W���0�@Y=^=\?8@[^}�>@\ਁ�+�@^�W�@`d���`�@al3x�H@b|���q@c��-�`�@d�m4�l@e�O�G@g�3k�\@hV�6�P�@i�KoC�@j��L�@lH�n훖@m�N�²�@oK=�Q@pG�RS@q&��S@q�ed�@r���*@se����@t9'��#@u�*�@u��|:�@v�i��@w��Si@x��W"�@y���u�@z�ט!        ?b@�u��X?���:Lo*?�S�5�Ae?��y �2@?�T�.��@?�K��?��.Q�~Q?��e�F�@����C�@
��_�As@��7���@f#XR�@p߉̄@�l���@ �I���@#|ᤄ	o@&W�_���@)n�'��s@,�����@0.o�pd�@2؟v�#@4/4���@6f����@8ŎIw@;L1Č��@=�A�e@@k$�N@A�����@C�+��?@E7S;�q@F�*�J{�@H�w��)@J�
����@L춒#��@OL���@P�˿���@Q�-A��-@S(,a�<�@Ty-�iX@Uٖ����@WI��%cj@X�E��1@Z[S	��@[�drfc1@]��w�b�@_v�zpTH@`�[��5@a�{�Y@b�����@c��V� @d���ǅ1@eٸ�8��@g��
� @h8f�ɾp@ix��f.�@j�~!о@lKX�1@m~L�}@n�RB�ߟ@p4J=²I@p�(����@q�d����@r�!��;
        ?�C�q�zh?�j����5?�b#�]�?�l|:U�?��ת���@)&�JfE@	�&��@���,@4�6c,�@?9I�t�@#���x�k@(@�����@-oc�S+@1��!��{@4�?4=(w@8W�
��@<3�W�@@36�M@B{Ǿ��@D�J�֊@G�����@J����,@@M��D���@P�%��M�@RT�WE<@TI�߰�R@VaT��@X�}9��@Z��:�b�@]vG	�)@`�Pn{@am�:���@b�È>@dh��i�@f"<�s�@g�O��}�@im��@k@�OF0 @m)k;V1&@o'8O(@p����Z+@q��Lp`@r��}ޠw@t ��S�~@u:'F��@v�� ��@w�Lu9'@y/P&��@z���4�r@|mZ
˯@}��g�l#@#e�T��@�_�����@�4b[=��@�A��px@���t��@��.�|@��B�Vg�@�����@����$�@���8Ӂg@��p2��M@��JO;&�        ?�?����@��  @;���*�@P�`9kl^@`�[Q��@j��H���@s��
gQ�@{����@���[�n#@��	��_z@�v0=�@�l�^�)�@�;�j��@�pq�T8�@�����@�	�n_=@���ṓb@���U"��@��Y���@�-7Ҏՠ@��r���@�Ǥ�iT/@��`ͣ��@����q@�8�2U@���'�F�@�&�V�:4@�f�f��@�ɚ�,�@�;�1�b�@Ľl�:@�N% e^@��.TXC@ɝ!
��R@�[X��+@�(��2�&@���OG�@�x%}�e@�uL\̃�@�y�k9��@ӆ3\2�@Ԛ=��+@յr���e@��p$��s@��쓌-@�4�K�'N@�n'�P�N@ۮŝQ�@���}�\n@�E�ѐ��@ߜ�8�6@�|���7@�/�	!@��͈/��@�+�9\@�Zב�k�@�
a��@��ɮ���@���@�@�p��04@�>��h��@����*@��^:"W        ?j�'�|ul?��5M/��?�B�wY�?�1�ǻ�V?�K���2�?���L�?���<��@��D��@x�1���@2�'x�@�+Q�L@fO��@���ѿ@ 3r�]M@"ͣwh.@%��Ǣs@(u�&�@+}�<���@.�����@0��yo��@2�O�k�k@4jb��;@6:���@@8���i�@:�s�?@<��,,@>'���@@`:�T@A&�.�@BAm/�o@Cc7�&E@D�/�$� @E�S�e�:@F󤋥�@H2)m��@Iw󃔕;@J� �Z�c@Lѱ?�@Mv$o�ǣ@N�=K&(�@P#%���@P�BT��@Q�����@R^Ϧ�@S$�\�A�@S�6A��@T��"�cn@U����iL@Vl�(b�@WI���Gl@X+^͙ 2@Y���a@Y�|��=b@Z�<Ֆ@[�D���@\�2��@@]��Y#@^��r~Z@_��ͥ�I@`u���4@`����Hf@a�O��@b�so�        ?f�^B|�?�,����?Å?Ձ�-?��Fh��?�m�u�?�UlW*?��mh?i�@\��n�@x!?�#�@M���@�m,��@�Q�@ �ZbY�@$ G)hћ@'�N�K�F@+�Q-�Z�@/ߧ��۫@2L���@4���<c@7�!����@:������@=��.�߄@@�G�YY�@B~�
�s@Dll���@Fv;s��@H����@J���Wk�@MBu����@O�0MϢD@Q0>'xH�@R��(�!@@S�~Ȇs�@U|DmT]0@W��b{�@X��0��@Z]�DZc�@\!=�'dJ@]�*H'!!@_��i���@`���S�@a�'w㭰@c3Ʊ@d%UM�@eL�t��.@fh#(�@g�#�'�@iV�&�@j[ExU��@k�8�ӓ@m)x%��@n�L{҉W@p�Ŝ�@p��:A@q�k^�t�@r����ɶ@sdܛ8�@tI�rc�@u6
C��@v)FC,��@w#Õ^*�@x%�n\@y/s���        ?+��W �?_��ᠩ�?}�m�s�?���Y	?�� h��?��FrX&�?�������?�CT����?��r��?�@} ��?�b|�!i?ۑya��%?�w�zf�?����Osy?���e�f�?�gPp�ӛ?��y�N`e?����.�G?�"���y�@ ���,�@g����@��5q+x@
LG$�@
�'��M@4cA=�@����1@H�cJ��@7V�7�o@n�4�$=@�H��@!�b�]@#�{�"�Z@&A����+@(�Jzn��@+`1[��@.>�R�	@0�,g�}�@2T��k@4�i�@6��^�@8�$���@:?X�Ab�@<��Ф�X@?h����@@���/	O@B<*�o �@C�����@EF�?�6@F��s�B@H�<��E�@J����e@Lq��g��@NzJ�ְ@PN��yBB@QmE��ߎ@R�ƈ�[$@S�Z�O�I@UYKB~5@Vu��@W����D@YRD�@Z��>�M5@\my�V��        ?Է��_��@�1H�b@/A=��@C�ȜO@S]�i(@_�3C�o�@g���E@p�!�h%�@v_ڬ��<@|��C|�@��1���I@��I/H�8@�/�e�R�@�����v@�я��V@�`���_�@�
���:@��%}�18@���R��@�����@�H!����@��<n��@�h���Ћ@���{y
@��O�oq@�a�Ҭ{L@��H�%@�ށ��eO@��	ȟf-@�=�}⅕@�+w��@�hY,�@��+Q�l@�z L�]@�	f����@����~@���?�@�s�h&@�/��N@�D��2��@�_r���@�� $^a@���Z։@��� �@� ^Z�@���1FǬ@�9�hj@�ډ���%@�~h�8�@�%:��N @��
RUy�@�{��9T@�+�P���@���RM(�@Ɣ�끭�@�N2��@�
�C��@��^��@Ɍ���J@�R�D@�љ���@��O.��@̸I���        ?VR���_7?�8�_ѕ?���&̟?��#�;/?ͲQBݎ�?��\+�?�
��K�?�2��&�?���;(?�'>&�G�?��Q��X?���$G@�=�&�@�@�@P�@�*�@{���1@*�y��@����{�@�IP��@�V���@$���k@�&�JT�@&�� |@ժY��{@!Q�IW�@"Ǚ�I�@$L͔̈C@%�Jq���@'�$�4��@)8qͼ��@*�C�]�@,ͫC�@.���^y@0P����[@1Q��G�@2ZY(��@3kN��$s@4��:���@5����@6��k� �@8��qÏ@9<bTsT@:	�~?�@;������@=?MUj@>x�Cl�@?��э�@@��&"�@A_o���@B� �g�@B�:�[�@C���P�B@Dw�{�I�@EI�`_(@F!7MY@5@F��5\�@G����Ԟ@H��Nb�,@I����I�@J����D�@K�&7!�P@L�\�6��@M��W��T        ?A�k���?x��� ¦?�Ӓ[�X?��p&I/�?��B��?��l�NG�?Ҝ�Fϔ�?�3��N�J?��V;*�?��kZ�;x?��f7�?�K����?�:>Ζ�?��I	vd�@ 2X/	z@L��Cy@ո�#P@
��܈k@]�3]��@8�C���@�F�@8̋Yه@��#٢�@����jW@!�_q�-@$L�_��@&�^���G@)�|N��@,̤W=f@0�g�K@1�ߩ�w@3�~8�@6[
��@8a|��]@:ᡦ�V3@=��t��0@@9�ts�{@A�:>��@CiX�s�@E*��/4@Gg��I�@Ik��p�@K%֨"@MU�n|�j@O����bL@Q��Q/@Rd��1ѕ@S�N��R�@U8盝V@V�S%�-U@XU���@Z#��`@[���Qz@]�d���@_|�9��@`�_n��@a��i@b�īؚ�@c���G��@e&�3A]{@f]A�o$�@g�a*���@h�B���        ?3V��l��?e���7L?�
0^x0?�񱋞�?�EJ 
�?�N��I?�,�?��?�x/�,�`?�Z�E1�k?،+#Q�m?��''��S?�P(��G??�a�2۴?�;�x�?��ԝ]��?����W�?��2$Q[?�����@�HC��@�`rў�@���$�@�8"M�@N�����@~s�6J@�K�0/@vmt�#@C1�2�E@H����@ D�7KE�@"�Q���@#�7�]�K@%���;@(�#@�@*C���@,��]�
@/0����@0���@)h@2X^T�TZ@3�?�.�1@5f+ڟ�J@7�Qf@8�;�|~i@:�v��@<�Mt���@>����c@@O3;��@Ai�����@B�nqNi�@C�U%�@E�σ�L@F_'_��@G��щ��@I4���@J�0�0�|@LJ	1Ỉ@M�._#�@O������@P�5�+��@Q�<�O�k@R�d�>��@S��CI�M@T�mp�@U��Q���        ?���~�n�?�c&Բ�/@�+��v�@%X[�R*@4(8�!��@@b�<��V@H*��Z�@P��ʒ�X@U��Og�E@[�� �Z�@a	��TK@d��.��@h?R4��@lBgoJr<@pFfM!u}@r������@ur���b@w�;B��@z[�Q�s7@}Ga��@�.[e�3�@��Iບ@���f�L�@�KѤ4�@�)��@��6�e@�# ̾+�@�>��=я@�n�(&�@���D��M@���(�@�>-��\@��熺�@�˵� �b@�!���@��l�9X@��U�T�@�b�Ue0Q@����O�@�mO��@� � ��@�Џ�2A�@��_���@�l���@�^�	1�/@�Cy�S%@�-����@�"��D�@�7�ͤ�@��E ��@�W*8��@�����,@�����@�2.��A~@�J�r��@�j?T:�@��~j�0�@�^�L� @��r����@��ُ<�e@�:X���@�� �4·@��e�(�E        ?^ d�d��?�=��� �?�'���?Ġ�b�.�?�n�u�?ߔ��-�@?�P�M���?�z,�N?�;rhs��?� w5���@ ����+�@7��O�@
pۑ��@+�C�×@M�wOo@��Xvr @2��!j@���P$�@��Z�@����pl@ nx�[��@"�'��@@#ӄ���@%�T)c8@'�@MJ@)�ڡZ�@+�Lp�k@-��s�W@/��\a@1$h�p�@2V�Q��5@3�.��@4���(@6._�3:�@7���X@8�F�5��@:cӏfs@;���ƕ�@=f*tɍI@>��J��@@I&��̘@A�6X@A�H鄇@B�Դ�M@C���Ҁ�@D��5��@E�˽�@F~���@Gvü��@Hu���U@Iy/{Q�@J��<�x@K�7�^�@@L���a@M����@N�:P��@PM���x@P�m����@Q7ĕ���@Q�YG&�@Rv0P�*@SN�d��@S������        ?Bc�
O�?z=�D~�?��|)�º?��6��?���/�?�C�����?���*ۄ?��b�#Q?��4�5+?��p��?���z�wb?��^��?������A?�Y4_H�@ R��uR�@NG�kN@�!��@j@
d����@�c��O@����]C@#�@�(�@�r	x�@�(�CI@]nW'҆@ �U=�@"z�I�Q2@$�����R@&����}_@)a ���@,�x��@.ۊ���-@0���{@2��*�@4C����L@6��oe�@8�r8�t@:l��@<9H��/�@>�l��	@@u����@A�.O��@C�r�_N@Dy`�(G�@E�=_,aq@G���2,@I��s�@J��ʊJ�@L� Uw�@Nt�m��*@P3$�d\S@Q6��|g1@RF%F�%@Sa.�I!�@T�f]�[@U�(|z�!@V���P�"@XJ���<@Y�xe@[SR�	@\��t�@^f��@_��6�8@`�i��=        ?L:Yٵ�?|Qp<�G?��.�B\�?���A�?�^Eu,s?���4轨?Ѭt�e?؀�us5:?�D^�d�?��"�f�?�Z+��j?�JHo�<?���G��f?��b��?���:�� @ ����@׽��Ę@)�90B@
����\@����@��]�p@ivf�\�@C*Ovn�@i���~@�w* k@ �m���@"�b0�oW@%C1]�4�@'Ȝ��/@*��:�|@-�0�h�@0g]��Ц@2-�)L��@4�1ˉ�@60w�"��@8qh���=@:��K+�=@=~�˘�@@'�`H�@A�2�H��@CJ,��Et@E 7��s@F�2���@H�{��#�@J�W�'4@M-�'E�@O��=�҄@Qw/?-#@RW����3@S��h� @U3��@V�])�@X\�6��@Z�@�@5@[��2Q@]���pYb@_�('*u@`�Eq��@a��L�@cG���y@d)����@e]lx�j@f�&_`�        ?�^n�?�7��Q�$@���O�@.穽x@=���߀@G��lE�@QNcb8@Wρ2�T�@_><o�A�@c�l���]@hc��Nr@mk�J��@qo�m��@t_X����@w�U����@z��{�@~o^�L@�"���@����@�4���
Q@�k�!G�J@�����@�.Q���@����-��@����,P�@���}%@������@�J���@��jp��@�43�,�@�������@��mK� �@�d����@�< �,@���с�]@���]�q@����ж@��>�{@���	�D�@��c��^@��ȢJ_@�����@�!hd&�w@�RȼPY@��O�1u�@���_�E@�%�Qy�@�`�݊�@�[a�1��@�
P�nts@��;�wh@�tA��=@�/�-�`�@��>6�_@��9SEn@�{��f�@�IN��.@�j�6F�@��B=��)@���M�*v@��,D��@���6j}@�|lJ;)�        ?6�0�?p^Q��?��<��x?��8��?�-���>0?��^(�n?�Pq,I� ?�TЭ�7?ܾX`��?���t�?��5V�?��Q���?�H��?��B2��<?�8e�V?�s��B�@�43-@@����@`��}@
H�+x@I��c6�@Y�VX�@).<T�@[�Lo@/��@4e��O@m�`�(@�ڧ�xB@1oz9�@ �F݌�h@"1��;9�@#�,�+*@%��4��@&�jƨ@(\�5��@)��g�}�@+O�ܵ�b@-(Qj�@.͝�"2@0Q��Fɳ@1Dn��@2?%P_�*@3BJOW�@4Mcl�@5aP�`2@6~	�s��@7��{�C�@8Ҕᘦ�@:
���d�@;L7��Vh@<�6�N�b@=����
@?I��u�|@@Xž�c�@Ab��@Aξ_$.�@B��d�@CW��o�@D#(��@D�/�q�@E� e�l
@F��kC<@G��;�        ?�w��l?S[����?u�#���?�.0�k�$?��T>h;?����I?�%h����?�}���?�(tμ�Z?�o�W,݈?�}�d�G?������?������?�b�$�\?�Ρ�J7?��$�?� a
?��c1�@t�d�2�@�0h|�@p*�@�o�@���L@$k��@�%��@�f\3@g�4L@ 
N�t�_@"	o�i@$3c�@&�9��j@)	~�@+���ި�@.��ݜb!@0�G���@2��Qe��@4Y��W/C@6>6��k�@8@��n�@:b�!��@<�n	�.1@?�y8v�@@�b��6#@Bk�@�@C|߾U��@D�c�@F{MFm�@H���Q@I��ަb]@K�ܣ��@MU�B�@O;L����@P���jn@Q��nգx@R��g�d"@S�Z4�qb@T�׌_@V����@WG��~(�@X�V+6@Y�:��@[�%w}s@\m=�NS        ?�|*y?Jx1�Jm�?l�JO���?��C��?�Cd�o��?������l?�NЋ�:+?�I�S+? �-��?�c�K�e�?�#�#�]?�Tm���?��F�z�C?�V'��?�F�l�p?�}Vaa;?�q�M`J?�~<�^?�m���.^@LI��)w@�X��D�@	��̒F�@W��߉@�����@��r�\�@��n4��@2�]�"�@���[j@!�1��M�@#�{]�x@&>|���@)@qI�RK@,=}]9��@/y,Z�@1{8b�!@3[~¢a�@5^���7@7��Tϼ�@9�+=ܡ@<E�$��@>��Dd(�@@ϧ�Sr@BC��z{�@C���;@Eh�+@Gи���@H�r��@J�٬n@L��3V�@N��}{��@Pb �[F�@QyDXF�4@R�U뺑�@S�VS��@U k�G��@VC��@W��>7M@X��k���@ZS)O��@[�v��@]D�'�	@^�'��q�@`3�<x�        ?�6Lp��L?�t\�ݫ�?�v����@H�6�<B@��[��j@%���@0]C}"�@7���CD�@@#��.�@E=��:Ǜ@KT,#L@P�d�)�p@T�����@X�u��@]u5�-@aBO��ms@d�*"8�@f��a_v{@j7_>�{@m�~�[�]@p����$�@r�Ğ�u�@t�R��-@v�)=R@y<*�-Х@{�r�cS@~>Y�mM@�w�l8@��Ha�@�Y_��R@�� ��	�@�}�A���@�)g�>s@��/+��D@��/W���@�����ѻ@��f��@�Å�g�	@���
E��@��w����@��v�-4�@�%��6@�U�jt�@��<���U@��F�!*.@�$�`�_@���&>P@��^}��@�Vޕ!:�@�Ӿ*+<@��"��'�@�x;qW�@�H"1�� @�ǻ7k�@��SF\�@���/� @��i��(Y@��J�u��@����ȴ,@��GSG\@��Ui.�Y@����	�E@��u"�92