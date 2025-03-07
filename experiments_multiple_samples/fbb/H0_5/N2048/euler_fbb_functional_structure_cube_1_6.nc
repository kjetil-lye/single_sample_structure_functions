CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T111158        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?��(���?ɂ���?ڮ���
�?��W�*?�-���?�PN�<�?�����]@gn�
	�@	D·���@�`W� @�R3z�@'�>Po�@_im�&+@�=<C�@T��z�(@!��P���@#y+�w�8@%~�&�@'���$��@)à�s@,$�� (@.R�«��@0Z�tfF�@1���R�@2׿#�@4#-��?@5wM.�@6�l��I6@88�Q�_@9��*^�@;��zx@<���6��@>�߇k�@?��d��@@���D�@Al�%NF�@B>|�e�@C��l[�@C��V]n@Dɩq`�@E���-J@F����[@Gt�0���@H_?�p@IMC�m��@J>���$@K3�}���@L+���'@M'0<Ͻ�@N& 6���@O(�S� @P����@P�����@Q �O��>@Q�F�T�.@R1E���@R��\�l�@SGܭ�Q@S�l�i,@Td{jW�3@T�~��@U��@V�M��        ?��[�c�?�DԀ��?���qδ?��+�v�?�$a?��?�;{�>��@�cj�؎@
��W��@�te��@j�@�#�@d�o�@�J`j��@ ������@#����T@%�7Fe�M@(b�i��@+?HN�è@.>���=@0�<�oX@2Oݣ���@4 ���l�@5�>����@7�l�xT�@9p�m�h�@;_q���J@=\�p%�@?h�?5�S@@��s�@Aսb�i@B��c��@D�!"i@E;����@Fk{�2D�@G��{G	�@H�Z���u@J!x�R})@Kj쇭�|@L����@N�}�2@Oly���@Pg=��'@Q:���@Q�+�]�@R��O�<@SHȪp��@Tc]c@T��y��@U�D�a@VX
?X0@W"��Ql@@W�=��@X�dy]�@Y�4_�@Zh�^�%@[@��C@\U#�W@\��S�Y@]�;D�h�@^�s��:'@_�&����@`C'h�M5@`���@a-󖼮�        ?��j����?�s/���?��2=�T�?�d�Շ�?����ę?��B+�9P@j�c@�@
AoN�3@a I��~@�Ac@�>57��@����@ >�鹈t@"��6�&@%$[�M�@'�d��=�@*�}�}�@-}��!B#@0C���A@1�W\X�=@3|L@D��@5/Jb���@6� t:�@8��"��@:�\�R�@<�n_��[@>�Y��J@@F0��t@APf~�@B`p�`��@Cw)'��?@D�c��@E�l�2,@F��Q`�
@H�����@ICfj��@J}'�9@K���mU @M��sJ@NL�#N�@O����L@PxL�gi@Q$��'k@Q�Qm�@R����@S:D��@S��)}*@T���B�@Ud��7(M@V"YoI:+@V���`O@W�����u@Xh����@Y.a&-JP@Y���:�@Z�9#ǂ@[�����@\\OEQ��@],�OI�@]�s��5@^��/-��@_�Uk�d@`Av�+��        ?�ӿ��B�?�d����?�`ۃ�@?��a�[fX@R�@	kS���@�����}@���xC�@+��	�@ ��p�͉@#�]|���@'�.�"�@*�|�L	@.�d�MmQ@1QN�=��@3r;Y�-�@5�53�\@7��n\�@:h���1@<���Ŗ@?�����@Aإ~�`@By����@C�Eε]�@E]P*��2@Fޫ�Yl@Hj,q��z@I��ȡf�@K��J�]@MH#��@N���&3�@P[ze���@Q>6�*��@R%�-��@Sh���=@T��>�@T�pS�,'@U�yM��@V��;֡0@W�E���@X��$[�@Y�����q@[��i'@\`�g�@]375�@^L�z�@_j�Lnu�@`F��#�@`��7j �@amZ����@bʹ+]�@b�:��@c65��R)@c�(�O02@do�3.�@ew�_@e���+bE@fS�m�F@f����O@g�D���}@hG�`�p<@h��� �@i�(�G        ?��%<^M?ȔC��?��)��5�?�m��)!?���u(?�{^�G\?�I��X�x@	�q�2@噝8@2�AqL@��m�s7@=��@E��D�!@�v*+š@R8}��@!�A����@#�m#4L�@%����O@'�/�'o%@)頮qs+@,0�I\�@.�-�S@0z�[��@1�%��{3@3 &�e��@4O�\f�!@5�P�_��@7.���?@8o
���@9������@;V-�gX@<�-l�g�@>[�E�@?�r�S��@@�@*���@A�Y�8\�@B^���@C4�lW@D���K�@D触���@E�FO�@F���Ĥ@G���ߴ�@Hz��'�@If�?�@JV%�%D�@KH��|W�@L>�M�q�@M7��)�Q@N3�E���@O2ȧDq@Pes�K7@P���؝�@Q ��_ @Q�>��)�@R-8W'@R�^���.@S?RPt�@S�#j��T@TV����@T�m��X@Us�;_�@V��!�        ?�#����?Д�^z�r?�d�24?��V�0zx?������>?���mR)@bճm��@��;S�@)�;���@���8Z@��0���@\�HQK�@!�%���@#�]֖�@&)F܍@(�%�11�@+ܢ=i8�@.��#xC@1���@2�QV)>@4o~�@@68`�@8����@9�q�D9@;�V5���@=�C���@@��I@A��?�@B2�W��c@CSf��@Dz�)ju�@E����	@F�(�7H@H��9H@I\k$��-@J�k�01@K�����d@MJ�s��@N������@P���an@P����@Qp&�i�@R*i����@R�O��,@S���9�^@Tj�����@U0z�5��@U�
���|@V�V	���@W�R�V�R@Xb�����@Y65A�xr@Z�/��@Z�c=��A@[�>��k�@\���y�Y@]|M�g=6@^^n��i�@_B����@`�`�S@`�kw���@`�`�2@au����        ?�#�tG�1?�'�'�?��O��?�=`��'?�I��I1?�{�a�N@���v�@"n����@��6�[,@����@�o�6֏@	.p1�p@ ���`��@#S*?�@%�ܢ���@(���1�@+���'�@.�/�@0����@2��6��@4Ia����@6��MF�@7�i���}@9�g`2@;Ŭ��'
@=���,@?�Źwd@A �/��@B5��]@C8���$r@D_	!$��@E�8�l��@F�YT@G��3��@I;����@J���xh@K��i�Z�@M$�@��@N#�F%@O�\~���@P����1@QX㖵U�@R�d���@R��H�@S�x�s�@TM�m�@UD�ؘ�@U�F�NX~@V��Re@WoT�0��@X>N;_K�@Y�j�*{@Y��<��@Z�����Y@[��.�e�@\o6�tie@]M%%�Z�@^-q�}@_+�/R@_�o��1@`ni��;@`���ۊ�@aX�-���        ?�$d�p/�?�� ��"�?�S����?�?M��:�@r�e��@
O��#@^�,��@L��5��@�ܰ[@ �|��*@$A���@'�ӉN�.@+8�w|]@/�b�@1����,�@3����I�@5����@8K�AD4�@:���B)-@=535�)@?�<8�v�@A:�	��@B�9��|�@D`�k�@EuSu�5�@F���9�?@Hw��a�d@J#l�U@K�|��@M@��N�@N�����<@PNɲ�@c@Q,c.�l@R'�9f�@R���n@S��G��j@T�˓tQ�@U��H�"@V�BR��O@W���3��@X�� +@Y�a�c�@Z����V�@[��#@�@\��	D�@]�L��TV@^�6;*O�@_���jSw@`�$���L@a��C�@a��_i
�@b;�4�%`@b�l@cd�d�@c��Vӕ@d�ؾ�MU@e,����7@eǾa��w@fdt��@g��AP�@g�S%lBv@hCq���@h���T��        ?��8��?�h��t?�A#BuN?������?�I��	F�?�ף7��m?�\�k >�@ed���@
i�-�@�e�N @C�V�E�@+jM�@?q��^@)��x\@諮�O�@ �H�|=`@"��vi�@$�B��/�@&�-�j&�@(����@*Č�c	@,�4���@/B���>@0�P�29�@2^1sm�@3=YO�V@4��{�@5̊�5�U@7}���@8y�%�.@9�x�+�E@;DHF#�Z@<�(.>�=@>*���:�@?����:"@@��@�@A[�h��?@B$��� s@B𶌙�0@C��V+>}@D�%�2*�@Eg��a�,@F@���P@G�,@G�H�CU@H��� V&@I����~@J�,Z\1�@K��%!"@L�y���@MpjĐ�>@Nc�g�
@OY��Σ@P)%u�L@P�۬+��@Q%�yO��@Q�_3�V@R(<��@R�)}�E�@S/�̑]@S��}k@T<Լ��@T�&i�o�        ?�����N_?ξ|�=�?�N����?�vU�9?���?1��?��g X](@�l�`@	p�蠢Y@�T�I��@T}�^�@U����@$����@{�ZCA@"�/�W@$|�^�X*@'`g6��@)��i6��@,�KMkr@/�=ɜ	t@1Mv��x�@2�Z�.�?@4�����c@6Ac�F@8Lc@9�lB&7@;�-��%@=�Qݨw@?���#�j@@����I@A�a���l@B���\�@C��]"r@E�߆��@F<�S��@GdY���D@H���C@I��FL @J��1��@L;׵���@M}TN?^@N�z��Z@P]����@P�뀻@Qa\���@R(���@R�rQ�R�@Su1,���@T+^7�A�@T������@U��]�~@V\.���=@W�?5�@Wݭ�C�`@X�ԭ{�!@Yh8qt�R@Z0�m"+w@Z��D�w@[ȋ��N@\���Ĕ�@]h�Q4�@^<	Y@_Z?:�@_趥ʻ"        ?�5ˏ��H?�?a��ǆ?�&���?�g�x��?�g��B��?���4�ۆ@*��Zm�@;����@�Q���@��&A�@����d�@.�@r@@ ��Q5�@#X���X�@%��y'@(�gQ��@+�����@.��R��@0�t)�ں@2�kiI��@4J��@6�Z+	9@7�U���@9���O�5@;ȩ\Ʈ@=��{�l|@?�Q�ׁ@Anf_:@BV�2�@C=�k��V@De|�.�@E��M�@Fɛ
�|a@H���@IH�����@J�pjI's@K�{郠V@M8��@N���!�@O��!7�@P��p[�@QhN<|�@R"���ff@R�2��!�@S�{~=j=@Tc�j��@U)����@U�7�tN@V��ڬ�@W��
���@X\��̴/@Y/�bY@Z���@Zދwd30@[��O�R�@\�Zs��s@]w�2�A@^Z#�?��@_?5y��8@`X��r�@`�II]�q@`�i
�@au�Ҷ�        ?��Cy���?٧&優�?���"�Z?���Xp@�� �G�@���5Ԫ@E��6@-'%��@\��}��@ Q�@�@#9�,��@&^�``M�@)��Op@-��q�;@0�}#�@2š��;�@4�}�1X@7��G%@9nJ@;�+�0@>J��y�P@@k�W�6�@A�*x�,I@CX�'�@Dz���<@E�@&ݔ�@G]��ɲ�@H�	��)'@JeX K�@K�cM��@M�ߵN@O2���R@PnB�(T@QG��M�@R$��(�]@S<N@S�}�ĳ�@TԜ�:7�@U���z�@V�?���@W��G��@X��o��S@Y��Pl�'@Z��ƈML@[�͔/�{@\�8WZ�u@]�`f��@^�p+c7�@_�*�Q��@`o��a��@`�W\h;@a���& H@b�����@b�Iii%@c:{��t@c�A}�@dc����k@d�sk���@e��d+r�@f,�M�\A@f�4%�@@gd�:��@hDЫ��        ?�͂��?�P?<��?�t�	S�]?��9����?�=;f?�@�r8�n?��X�a�g@�`ȇj@�-�L��@�G�l��@���8@���>�^@�g�h�@-6ó@��-��@ ���U�@"i��I9
@$U���B@&S��?X�@(cjٸ�r@*��w���@,���z�@.�uzr��@0�֧mz@1��Q)�@3
y�~��@4I^��^�@5����S@6��s^l@81>tǄ@9���'��@:�o!�7@<W��
��@=�HҘ�@?=�90�@@]$6�1�@A���'@A���<@B�}��"@Cv�~
)@DD���(�@E�}���@E���B�@F�ml�@G�%M��@Hv� M��@IU�����@J7��%��@K{d@LF@E1@L�^�� @M�dO��O@N�F��L�@O������@PV�.Oub@P��Ti.
@QNP���{@Q��%�	�@RJ�&�s�@Rʑ�X�@SK�����@S��� �K@TQH]�N        ?�5����?�e�m��^?�w/ˋk?�*��5��?�oUc�n�?�=��R@8��,U9@
 �FL��@7�IH6�@�����r@��:)�@�lH���@ --`H�@"jGE���@$���@'��
N+@*B��%;@-!�	.�@0��r@1��*)��@3<���w@4鏼�+]@6��cO�@8nWF��?@:E�s��@<*��L@>�(�y�@@��G�@A��ij@B!����@C432��@DM��lR@El�N�A�@F�oe��@G�*����@H�0�2@J"�(/v@K^DX��@L�OC�@M��>A@O1l}�\3@PA)��B�@P�,o?@Q��E�bo@RI�#�V�@R�(W��8@S�4d�@Th@��/�@U!���@Uݹ9qq�@V��6���@W\Q�WM@X��X�@X��o���@Y��5 ��@Zt	�;;�@[?X�]�@\�Uk�@\�=�	�@]�ƉWI#@^�U�-��@_V�<7�@`81�ni        ?��D���?�YGZѬ?����%�?�/EZ\b!?�?W}\�?�k��H�@���Y@��@��H�@���1u@�7A�e�@섶8�@ Ʈ���@#<����@%�Ι4�f@(����!�@+x���x8@.}��M@0�x)Ɋ�@2t�7��@4(p�`-@5�����@7��M�1�@9���>[o@;��[��@=������@?��~E@@��o�l@A�L��4@Ch�Z[@D2Mj�H�@E[�9��@F�%f�@G­���
@H�����?@JC	q�f@K��}@L�o����@N2>����@O�
�3/_@Pw���@Q+���@Q�S�Tk.@R��' ;@@SX1ͲF�@TVK��@T�@^�@U���3@VeM�\�@W/dM��@W�)���@X˗6�x�@Y��� z@ZrN�q��@[I���@\#P���@\����\�@]�g;ؙ�@^��W��`@_�_�y�@`D�(s6�@`����@a.s8�2        ?��p�t�?�u�x��?�����k?���~`�@jG�TF@�d��j�@b�`K<�@'��dn@+@�i�@Ȏ��y@"�t��H	@&+R�C�@)�I���@-B����@0��fjd(@2���HU@4��%��@6Ͼ:���@9[��k�@;d�ע�l@=̩zg�@@#�_[�@Aj!DZ��@B���9��@D��e6�@Er	L@Fۢ����@HM⡛^@I�w�t,�@KG�Lv��@L��@�F@Na�Lj�@O�dK�6o@P�.(�	@Q��`5:�@Rx;�l�@SS6߿T@T1�!z�@U����@U�_�Tn@V�K�	P�@WΎ�2hX@X���Le@Y��wa�@Z�����@[���7$$@\���x�@]�O /i@^���(�g@_����k�@`UX3`�@`�ˍ�@aa�䂩@a��C1w�@bs�w
��@b��o7p?@c��=s��@dl�J�@d�Y����@e7�'.�@e�{YM�@f[�{��n@f�ϙzJ�        ?�>�5�?�M/��?�R�r9��?�t�Ϲ?���,�?��s�GT?���=V@]9q��@	Gn喝4@��N(��@5tlP+@Lve�q0@�Z[��m@�w�Y!@�����@!���LT@#��MX�@%��/f��@'�N.|+@*;�y�/N@,�;��r�@.����@0��VC.Z@1�7oM�7@3A�M�@4� �x�@5��:�@7Z铆>#@8�C,�@:?����@;���=@=D?��v@>��ܔ#�@@3��fn�@A��/t�@A���yf�@B�r;T�@C��xm�@D_ ��a@E>�k��@F"!��E�@G�t�=�@G�_���@H�FA���@I�Lyk�@J�g��
@K��Mh*�@L����d@M��ȴ\�@N��	dB�@O�����@PY� �%]@P�yo�AK@Qb���J^@Q� ��@Rp�y��`@R�$°,@S��2��@Ta��2�@T�ld���@U+�(8&@U�G��,.@VL��        ?�T�w]?зF6�$?ᇈ>�gL?��(���?��W5ZR[@ ���ظ@��p}@�YH�.@M�@X�@�ڜi@1��-�@��I�*0@!/ܧ�GV@#�ja')�@&b�/���@)4��'�,@,*�2���@/Dp��@1@'|7V@2�*�F�.@4����)@6*(ƃk@8_x5���@:O�^�P�@<O:�s@>^+R�@@=�!xi�@AT.iX�@Bq��@�@C�8V��@D���O@E��Ұ�@G,���!�@HlU)�� @I�c0��1@J�ѝ`�d@LQ�ݽa@M�^D�'@O	E�^G�@P7�,��@P�m/0�@Q���W��@R_��Q��@S���\@S�N[���@T��-�+@Ug����@V0-R���@V�M��,�@W��} x|@X�����@Yk���/@Z@��	�`@[Ւk�@[�wi@\�g|U��@]��2�&@^��u|@_n��>$�@`)��E"@`�p��Ζ@a�-G@a��``R�        ?����B?����]Z^?���3�%;?������I?� �.PM{?��V�!@�g�'��@
����Kt@�B���c@SZ�k�@HX��@��-��@ ��V��l@"�di�=,@%�!O�'@(>��fx@+��ϙ@.^�G@0�:�Ŏ�@2.@��Ah@3��7�S@5����>0@7_x��z@97�_Ґ@;C���f@=��>$@?U�!J�@@�ƅ{��@A�����@B�LV=@C֍���@D�n�oS�@F"�M_�V@GQ��W��@H�l�JPz@I��*�8_@K<]�{�@LKk��C�@M�Y�R7@N�����Z@P!��r@P�j�GfP@Q� `s{@R6K$&�t@R�D6^�a@S��Z�@Tc& �H+@U"-%>x@U�o�伛@V�l�O�@Wm��ۃ@X6��{�T@Y~
�$�@Y�{EG�@Z��3ư@[s�/6��@\I�Q��@] ���L/@]����]�@^��,1)�@_�����@`KM��@`��b�+        ?��ElPT)?ۢ��?�	�Ӊ�?��k3��3@�S�j)E@
�*�N��@��1:@ѡ��I�@h@ȳ�6@!B<$=�0@$�C@X�@(�ݧ�@+�n
�='@/�,s��@2	�w�@4=)�"�@6���ٞ@8�$K��@;n�5W&@>�սV�@@W�����@A�O�w@C#��@D����w@F��L@G�,A��;@I88��@J��urΦ@L|�\H�s@N-;���@O�lϲ�@P�O��:�@Q��v�f@R�Hd�m@S�۽e�@T��5��@Ux�r��>@Vrd���@Wo�lg-�@XqL���-@YvR4(mv@Z~�8tγ@[�(�I@\�عc��@]��EĜ�@^āH���@_�b���@`}�n�@a�R�@a�ْ�%p@b3EaR�`@b�@�ث@c^Ƌ���@c���$�4@d�V����@e+Ts�FB@e���2@fe�uf�@g�X�^@g�qQ�61@hGf�(7@h����@i�Q��        ?�"Ĺ�)(?�Z��Y8�?�y�[Mm?�ݹtUo�?�}����?�1�$�?��-��Q�@���@o���l�@d�+k�@ݽ��� @��3� g@�L4K�@�&���@Oofd�@ i���)@"?J����@$'����@&!��~�@(.1��$�@*K�ק�@,zc�T+$@.���a6@0����7�@1�]��@2���4@4+\�:~�@5rI���J@6���X��@8U��)P@9s5����@:�(���@<B�/@=��0���@?,j����@@UϢ��>@A�ݝ�@A�Ĩ_u�@B�=�[�@Ct^1�)�@DC� >ߎ@E:Q���@E�Y�]@F��k�@G�+�,�@H}8ۊ��@I^�Ȣ�@JA��Z�%@K("���@L~'��@L���+G@M��@��@N���R(�@O��Q�T@Pb~�@PުK��@Q\Mw5�@Qڬ%�<@RZz0�S�@R�w��@S]���-@S��m@Tej���`        ?�rNX[?�h��W?�v�o!u�?�(�
]x?�mBpRߙ?�9�fk��@6��x :@	�(��}k@6H��yd@�0�~@�5Ⱦt@����Է@ ;x4��@"iR�IC�@$�*G��@'��Y�L@*A�W��@-!%iiO@0��.�@1�>U���@3=��n�@4�
�+�@6� �B�@8q�h�@:JC˭dh@<0��;Z�@>$�8��@@�xo@A=E��C@B'͆�C�@C;���$�@DU��j�c@Eu�2P߿@F�t��s@G�'�1�G@H��$$�@J/��l��@Kl$���@L�#){H�@M�~����@OB#8��e@PI�_2�@P�~3,
@Q���k�B@RT��f@S	��I�@S�vs��2@TtK��F@U.�F�ŉ@U����@V������@Wk(g~��@X.�#GA@X�e�Š�@Y�i>��@Z�����@[S#3�V�@\!ϡ9��@\���?@]űIG�@^����L`@_r7���A@`%�}s�        ?��%��J?�I|5�?����7�o?�&�B]�?�7$��~�?�_���w@ �ﬖ�@e���@�)���2@����@�-$��.@揷)jI@ ��Hq�@#:Ps`bl@%դ1m:!@(��}���@+wh����@.|<P��]@0�ZВ��@2uQ��@4)�A��@5���hC�@7�DZ�s�@9�X@;����3h@=���E>@?�ɪ��@@�-"��7@A�u`@C�ȼ�@D7k�8��@Ea��!N,@F�ʇ�m�@G�X�U^�@I[��@�@JL��!#q@K�[��	@L�+� @N?zN��@O������@Pho�}�@Q3����@Q���@�@R�o��@Sa�~��@T!�Gl�@T��J�@U�-�>�@Vp����@W;C���@XT�@X��f
@Y�/
���@Z~�'W�@[V%�'t�@\/�1JR�@]�L��U@]ꎛo3]@^˄���S@_��_Xk2@`JG/��@`�LvTx�@a3{@�O�        ?�2�e�e?��j=E?�d���?��\i�b�@/��<@9?=rG=@.j&�^@�P+��s@�����l@n��[@"�����G@%��T�>�@)`ȇdU�@-��{@0h�޹)@2h�\�V�@4~��\�0@6���@8뾬�ٍ@;A_ZE��@=��T<�@@p譎@A\$��]@B��̱r@DIC�@Ek�J�m}@F׾&h�@HL���t�@I��'�{t@KOE��@L���O@Nru�ՂI@P��-@Pڃmt��@Q�߹7�@R��Ȑ�@Sh�W��@TJx�R@U.�y�P@VUeC��@W*��@W�f��?@X���+;�@Y��Y�j@Z�-Ȏ@[�[=�o+@\���G,�@]Ҁ�ޤ@^�4�+2�@_��N��F@`vT�c�>@`����_�@a�xH���@b�Ӗ�@b�_^���@c)o��Cg@c��Q��@dG��#�@d��F|��@ekKB�T@e��[@f�"�^�@g*x�!�H        ?��M��?�r��S��?ׄ��܈?��m�?�UH�u�?�D�����?�D��ʓ@ڽ/�@_�BT��@����0@����S@�(���@�,�w+'@�S���@���D@��2�@!H�^z5�@#�\qh�@$�q����@&�s��
�@(ڎ9�dq@*�Tc	u@-_9^�@/.T��_@0��8��R@1��O���@3ۃ��@44��^Z@5m_[ޓ�@6��$Z@7�Ԫ]]@9>�}�v@:����S�@;긎��@=I�D��N@>�^覗@@kCcI@@�%�X-N@A��0�V@B@l���s@C��ѕ�@C�/D�x�@D�E��@EW�:�@F#�`r��@F����@G����C@H�T xoO@Ipg�!��@JJ�R�w@K&'��`@L�1͎�@L��Y���@M�p��\@N�o�ǜ�@O�����@PAWx<�R@P��3�p@Q/¾=�@Q��	��@R"��
@R�L{ɓ/@S�c��/        ?�O.�.:�?ϰ��Ky�?���J��?�i�L��?��Lo��?��K�X�)@n1�Y�V@
JoX=rQ@iiE��@�5�@�<�@!9��N�@ R��Q�@"�>��+A@%FOحu$@'�����@*�ʤ)��@-�����@0j���T@2��݉@3�HvO��@5l���-n@77�k�q�@9��yh@:�$@1��@<�
v�@>�en�.@@��I��@A�<]��[@B�[�W��@C�;E7�T@D���s@F �K�)d@GSB�,@H�(��@I�/�C�@K-X��@L[W�	��@M�v�'��@Ot�<��@P0����@P�_�6�/@Q�rO�;�@RLM�\��@S�J>@S�8�ofq@T�6j�~�@UB�Ʉ�	@VC�0�@V���J�@W�G�@Xc(�<$�@Y1����@ZY &��@Zՙ"���@[�?��@\�Cx�@]]�e���@^:F�P�@_7���=@_�i��@`n�f��@`�H��_        ?����)�?ϼ�5cV?����4�?�9�G?��#*R�4?��5��ѱ@���3x�@
��o�@�K�e,@J5�2V@@��g�@�#�(�O@ �kʕ��@"����w�@%�C��@(Ix}�@+$�i��@."u/x�@0��U�N@2A�@3�d<���@5��	eQ@7�T^H,L@9`X��Y�@;N[ҁ\r@=K�Is�@?VK��@@�ւ�g.@A�{3��@B��=zL�@DWl@E.�k�$@F\���fS@G�f����@H��J�&@J�f�5�@KS|
U��@L���@M�R��m�@OJC��8@PSᝩ#�@Q\]"��@Q������@RpP$C��@S)���@S啳�,1@T��"�4]@Udʖ�3�@V(i[�@V�B)��@W�ogu@X���Ƌ@YK�D@ZwU�@Z�&GzI�@[�����o@\��ǰ��@]i�c�@^B�Y_c�@_��ױ@_�^r�@`l��\@`��U�        ?��S ?�(�&?U?�e%ǭ��?���j��@ ��pE�@M�_���@#�7�@��-X(@�B�"&�@B=���@"�8�/@%$1��M�@(s��j0F@+�on�@/��(��@1�$Sx�4@3�"y�v@5��C�K�@8� �X�@:SSCyaN@<���ޱ@?.�@@�R���@BM/S$@CbYN�D_@D�M��C@FW���@G�Y���@H�*�!�7@JzV����@K����d,@M�;��@O��nh@P^���9@Q0��ў@R�#@Rߵ�ų~@S�e�.@T�3�S�/@U�����@Vk���@WV�Mߍ @XE�>�Y@Y8]�xV@Z.$���@['/�+s�@\#s��H�@]"�!M3�@^%zb��@_+,Nb�K@`���h$@`���+@a'\��{�@a�V�E�@b:��[|{@b�ϗ���@cTJ�g��@c�B�,�D@ds�I6�@e��3n@e�VW@f-��؜:@f�(���        ?��? ��?ˮW�_�a?����U��?�����?�T��i�?��P�G@@��጑@��B��k@/����r@iq@SB�@p#W��@�u"'=�@8j1hp@����	A@ �V�v�@"��,���@$�έ�� @&�b�n�@)�_�&@+]�Ҁ@-�D���@0��"�u@1S�z��@2��Q�i-@3�|c��@5H��u:�@6��z��@8����@9��&*�@;�&�߱@<��׵%�@>+�̰-@?�t+q�@@� ��~c@Ao��!�@BC���I@C�*R(�@C�HlE1�@D�:��!@E�����g@F���,l�@G��j��:@Htq�]B@Idg�V2@JW���@KN�y�@LGė>�a@MD��G�Q@ND�����@OG��o"�@P'ɼ�@P��C�9�@Q2�+d�@Q����Ǽ@RCi)�Eu@R�]#�N@SZ����@S�ɄG��@Tx8��Z�@U	�� �@U�o�Pq&@V/,�Ҽ@V�O���        ?�j�.:?�~��r�?�M)��7?�A����?��@��4?��O�9t�@E0���P@]�h���@��E@�86ƚ@�Y��@D�>�|_@ ���7��@#|3��ՠ@&"��d:@(��m�.@+���v@.�8��s0@1�!�@2��>���@4|��h��@6JC�ր�@8'�M.R@:%ܧ��@<���@>dd�^!@@�m��)@A2�̨�@BNw��@Cr&%��@D��4!��@E��o�(@G��ndT@HGP���@I���5�6@J�独5T@L.�]��@M��oثm@N�do��@P(qg�̧@P�2��@Q�π�.@RVC��@Su�L�@S�5r�X@T�M=��@Uh_Oʌ,@V4eO�(�@WYO�_�@W�5r��d@X��Ih�0@Y����@Z\J1��@[9K/i�@\[&��%@\�.���5@]��k@^�֛��@_���6A"@`QQ� �@`�v %|�@aB�ϗh@a���2�:        ?�<Q�5��?�T��&3?�?&Q4
�?퓙;�ͯ?����H��?��^a38@H�\�S�@a�T���@�k�h@Бp���@�}�Nx@=��Oi@ �!�#X@#q�Q��@&�T�н@(��=J��@+Ç�q��@.� ��@0�9D���@2�H�@4_4��l@6'O�{b�@7�b�@9�:K�ь@;�t�b��@=�~�BR@?����j@A�����@B#~��{@CBg��@Dh0�I�@E��sIa�@F�z�SF@H �_8@I@�k,�E@J��2+��@K�hz�g�@M%��ʅJ@N~����@O�Le�9�@P����A@QV&ʑj�@R>Ia�@R�-�nl@S��+޳@TGpr��@U
�� (s@UЧ���R@V�J�F�e@Wd�YZ��@X2w�4�@Y�	h!@Y���U��@Z���K�9@[��1l�#@\^@���@];K�yh�@^�S�2@^����n@_��=Z��@`c��b@`�U��Q(@aN�̠�        ?�ҀY���?ڄ�f��?��'ܫ��?�ްC9�@*��|�@	�V��@M�]�\@��?};@fm8�D�@ �m�s�&@#޴y��6@'P��v�@*����z@.��#R��@1}�Y�J�@3�:'�;u@5�9�d�E@8?�,��{@:��4ſ�@=;0LsWk@?�ry[��@AI(�$�@B�S:H�'@D RF��@E�Ђ�<@G!��Z�@H�v��@JK8�Ww@K��d�V@M����J�@OQ��J�@P���[�F@Ql��O�@RU����@SB�a	��@T4 rh�m@U)��0}�@V#c'�w,@W!T��_�@X#c���s@Y)��b�C@Z3��T�@[A�s�p�@\T���@]j9�9�n@^�A��@_�(-*�C@`a��C#;@`������@a�o���@b BY�@b�yAW�u@cR�3kh@c��¨��@d���G�@e,�_�ǯ@e�I�m�*@fq�����@g��A�@g���J6M@hf3B_�@i.����@i�Z��o        ?�:fC=��?� �k�e?�"c3��A?�8|Y8-�?��k{ ��?�~0I6�?�)�)0;@ށ�tU�@�*X1�;@��ji�J@�(�~*@�Y*�et@����@�%p�w@T�GFB@ �*��@"���$@$� <v�@&�a?+E@(؄;A�@*��*��f@-2($�K@/w]�]\�@0�RG���@2Τ._�@3S 0��@4��0=O�@5����@7.�m[�j@8�����@9��J<�A@;K����@<��q�p�@>,�g��@?�p�')@@�W,%��@AX;��S@B\u��@B鬦�ބ@C�#�@D��Z<@E[]B��@F2c�Z@G�v8r@G�keJ��@H�J��@I��H`�@J�#���!@Kx�S���@Lc�&ڙa@MQ����y@NBo�.�@O5��R�@P
wr��@P�s[�Q�@Q++�lE@Q�-�yW�@Rwx��(@R���w@SѰA<�@S��Qb�:@TMT�@T��a���        ?��G�"`�?�A!ꥣ�?��I�֋?�
c��?�Wp��?�+�:`�9@ׁ�!A�@
�(_ �@��"(�F@[^�W�H@Q q�
@�l-I\@ �@[k�@#%搷�@%��#	�U@(I��P22@+"h�+H@.wRLD@0��)��@2;�{Y�Y@3�w^'�@5��(�Ҧ@7x<�Ջ�@9VdlD#w@;C��}�;@=@K���@?K��gx�@@����@A��%^�h@B�%�Y�@De����@E-�m�x+@F]{(�	�@G����@H�]e��@J�#�@K_?��u�@L����@NZs7�S@Oc��J�@Pb��^�@QSR�.�@QΡn���@R���)�K@SE�*3}@Tœ�r�@T�rt�r[@U����@VV
�@W �NA��@W�f�B��@X��Q i@Y�HP�bg@Zf��q�@[>y\ �@\�XdW>@\�Љ�Y@]�?�&o�@^�+Ɯ)@_����%�@`A2�@b@`��eX��@a+���!B        ?���._?�i�W?����m�?�i���x?��%����?�i��Z)�@�f���"@	A��q޾@z7��o@&o v�@��1��@�La�3@U��Nd@!�8]@$+���@J@&���]��@)L}ak@,
ć
�@.��+��@0��_�-@2w��gŔ@4�ɵ��@5���@7dq5�w@9"���c@:�^��	@<��R�^@>���#�@@J�
y~.@AG��p<�@BJga�'�@CR���PO@D`t�H�@Es��@F��ϵ@G���_�#@H�c�	n�@I�)��r@K ��4@LR{�P]�@M��Y��@N��,<��@P�/�v@P���H@QH��|�@Q�3���@R� ���@SC'Vfݳ@S�\:�@T���@UQ<=�@V��7� @V�Vc$�@Wq�G���@X++TF�@X�D\]�@Y�736@Zcta'Ի@[$����@[��z
�@\��H�B@]s�

 �@^<'��M�        ?��1ӇR,?ى)�C��?���*F�?���̲?o@l��?iz@��(�p�@b��Sp�@��J�@(�;pA@�s�*f^@"꼁i$�@&)��WH�@)���A6�@-C�r��@0�_�Ĥ�@2�B��_@4����@6�gm�tt@9]����@;x&K~B8@=�:w���@@4�6��@A~����@B��ƓϠ@D0G�F@E��>Ϭ�@G���@HڀP~@J e" ��@K�R��6t@M�xm�@N���d�@P-H~�z�@Q�UA�U@Q܆�}��@R�&,�C�@S��Y�5F@T�+�M�@Ujy���@VW�\{EK@WHr1Ȗ�@X=�D�@Y5A>Ec�@Z1���@[0�4�j�@\3u�{�@]9�#bZt@^C���9@@_P���@`0�G�A@`�{��Ŭ@aE�:s��@a�H�;�@ba��ѷ@b�ɿ��@c�x�*\�@d�0w3@d�T"�Y@eAx8;��@e�0u��@fr^�8@gD��@g�L���.        ?��p�;#?ȱi��T�?��O���?�	,,?��1͛L?�f��|-?�C��6
@�c9�@�i��Y�@��gU�R@����d@�;D�@ԝd��@'�a�1@��Ձ@!%it��@#�y�]@%'�$	@'��`@).\d�7@+]R0*G@-�I?�Ak@/�ܼ'N�@1'W�.xI@2_����@3�֡�ow@4畭Z�@66�i��/@7�H��\+@8�����@:O�{RP�@;�\���@=-�-T@>�ng�@@|����@@ֲ���!@A�#���o@Bf���v@C3����e@Du���@D�p��S@E�xp��@F���|TI@Ga�F5�@H@�O�Pt@I"^(VN�@JC��@J��ȱ�@K���=� @L� �}�@M��0���@N�I-�6�@O�`T @PJ�f(�l@Pǩ-mNF@QFoUI@QŴ�gJ�@RF��8%�@Rȳ�H[6@SL���@SЇ���e@TV:��1@T�Eh�        ?�/C[�T?ВXG�?�_��	�?���	��r?��݌��?���"b	@]_�/��@|ƀ��N@'��P�|@�� �@��*h@a��FG@!w���@#����o�@&4c�V]�@) �v���@+�c��@/9:s�@1���n@2��ԑ�@4������@6W���@86�Y��@:%oɱ�@<$.��@>2C�I�n@@'��d� @A>Ke�j@B\!?�P[@C�T�b�@D�ʣ�8�@E�lN�{�@G �2�h@H]�0���@I�c ���@J��|xpD@LKם$�@M���(�@O�
ʆ�@P:�v`�6@P����n@Q��2�@RlJՐ�@S-��b��@S��h<�@T�o�r#6@U���,�@VQ�h�@W!&����@W�#D %@X��&�@Y���?��@Z}�H�͆@[\��@\<�M� �@] uGwՙ@^�Z�@^�v�h�@_��f��@`d�����@`���P�@aVټ@W@a�cOj��        ?�Nj���?���uC��?�DK3��?�߇	ې�?�91�Glz?��_8]k@�o�}@	�a'��g@y�:�]@�[����@R�l���@e�7�A�@��K��@"0t�E%i@$�g/_a�@'5;s~�@)�+>��@,�>f�>�@/��ߟ~s@1\�E���@2�Q7<�@4����D@6H����R@8|����@9ժa��@;����&@=�(-�>�@?��V�V@@ŐRG5z@A˸�Ź@B����T@C���Rc@E�y�@Fڝ�6?@GA�#�hc@Hjͥ��@I�ؖKh@J�۟I��@Ly �@M@k`)�@N�����0@O�5!�@P�A��i�@Q3����@Q���B�@R���@S;����@S��}��@T����.0@UXX��|@V��E�@V�]nE�c@W�:�@XG2����@Y?Z��/@Y�X��
Q@Z�v㯗�@[W�ϸV�@\ ��\��@\�,
|@]��x�u6@^�Sъ�W@_W��I�j        ?�@A�`��?�����_�?�[���R�?�@;)�z�@oP�"\@	���r	@SmΗ��@8pL���@�Ͽ�J�@ Ŷ�}�Q@#�ڗm|@'^��&�%@*��$8�@.��F@1j�O��m@3���9<@5�~�%�@7���,~i@:Y.���/@<ʖ֘�9@?P@�|�@@�Ҡ��@BK#�A�+@C��7�T�@Eÿ�E=@F���k��@H ��-��@I�~2�!@K,�@L��KuN@NAS���@O�3���@PɈ��@Q��K��(@R�!��#a@Sd+�:�@TI�F�I1@U3l��b�@V �Ï�%@W6!��X@Xn`���@X�$~��@Y�N����@Z��|�-�@[�Ԃ�2�@\���T@^��ޗ�@_i4�p�@`�ٶ�@`���/n�@a$Rߥ��@a�q�^@b>��W�@b�.us��@c]�km@c�ɫ�)@d�@tD��@e"B�}@e�j?0@fF�2�@f��ݫ@gy{�C@h3C[i�        ?��1��f�?Ț�jHn?�����M?��ZD��?𮫾sU?�l�Z.W ?�,�ql>@��./�\@�$��-@�^7�)�@�_!�9�@Ѩ[�B^@L8�X�@dE%�B�@����N@!R�eQ��@#A����@%DH�w�@'Y���*@)�t_q�@+�Oԟe@.����>@01�Q��7@1h��@2��p��$@3�IU��@5;�_\�O@6�����@7��_C��@9Sy�@�@:�7.��u@<1�8B@=���b�m@?+ȍ�k`@@YQvBv�@A�s��q@A�ʦ*�s@B���l�j@C��[(]@DY��UX@E/����@F?ސi1@F����Y�@G��8z&@H�*F�B@I��[�E�@Jm̯��@KU�Q(j@LAld���@M/`!Z�@N�;��+@O�����@P���8@Pɷ��@P�����@Qz�r��@Q�,��s�@Rz����@R���f[@S~���-O@TV �˻@T�.�7@U�t	;�        ?��Geͅ?���� m?�Ν`6e?콙��?��(���?�Ր�"g@�^9{�@
�~�~�@��o��6@��@W�B?@5�	T��@ Y ��@"�.y;p�@%@Aq�@'��T�1@*��QLC�@-��/�3u@0O�1�*@1�E��l@3�}|^�@55z!��@6��8J^&@8¤��+/@:�F2F�@<����΃@>~[�{�@@A*Bs�@AI��|�@BX�U���@Cm���q@D����L@E�]�-)�@F��VU�@G�_��@I2?p�R@Jk'/�@K�����@L����@N7�:���@O��X#@Pm�T�?�@Q��<n@Q�9�g@R|e՟��@S1#=�Q�@S�j��C@T�5�c@U^~�O�@V<?��@V�h��@W��{ �3@Xg�+��@Y0=��X�@Y��k*��@Z�̱ ��@[��#u@\hz���@]<17�@^ DX�@^�B�
��@_ĕ��C�@`P����        ?���gP?Ϟ"�l��?���`r?쓼���?����'?��>T�#@��V�k/@
m�ژ�.@|��^?�@r7y�k@��Ȭ�"@0�7O@ W�,��*@"�bk�J>@%B�]��N@'�.�ع�@*�m�X�@-����\@0W��^w@1��
�7@3���7��@5GH8+@7
sl��+@8�'�Z�@:�[��@<�Mf�@>��Ձ�@@Wr�=�@Ab���ބ@BtN��]@C�\~�L@D�����@E�'�lQ�@F����AB@H*(�l�
@I`~W�T,@J���W�@K�^�8�@M%�!�|3@Nr���E+@O����v�@P�GH�&!@Q<��^�K@Q���d�@R�u 6��@SW�,��@T[�b�@Tˎv`�e@U�6���@VIL��M
@W��qI@WФ��j�@X�ةĻ@Ya^�w�@Z-01o��@Z�FrW@[˙�8L@\�$��".@]rߝBM@^I�]%P@_"���@_��%#�@`m��׈7        ?��w޷�?���C$�?�)ʛ?�]&v{�@Q��5�@	����@:}���a@�_���@�{�_�@ ���4@#�v�@'J���\@*�dG�yD@.�'؈�g@1a�����@3|�R@5�e{���@7�xv�r�@:W\r@<�l�cx�@?T�?۱@@�_n��@BPt9��L@C��{=@EڔMF@F����.u@Hom`.�@I��,u@K �l�l�@L���gyN@NU,nG��@O���[o@P��[�@Q���+�@R�����@Sq�@TW5�SK{@U@�.+�@V-���v@W�-!@Xe8�O@Y	�Q�I�@Zі�P^@[@6tu�@\�Z7 @]H���P@^˲K^@_Ab���@`�|U�@`�q'�m�@a!~NrA@a��V�VZ@b7�~#6�@b�m1�@cS�����@c�z�%9@dt���ֶ@e;% �k@e�N�A@f0Kq�R@f�p��ɲ@g]��j��@g����<z        ?������?�caL��q?ڒ��y��?����r?��^X�*?���^�?���xJd�@<O�V@	e�%R�@<!?�)@�Χ�@��O��@�V�~�@U'�3 @˘��@!4%'�sV@#�d2�@%b��?�@'oh��@)I[v[P@+C��@-w�V�G@/�bP�\)@1�(�t�@27�%$�@3o8qu�{@4��t L @5�v1��@7?�ޱ9�@8�����6@9�
L���@;K���)@<��C��2@>?� ��@?�����g@@�u�:]�@AC��%@B}�P�@B�Ej�@C��#�2@D\̅p�@E)�/@E��R-�5@F��K���@G�yu|ܽ@Hv�p��@IP'y��@J,c&�%@K
PO=cv@K��z剞@L͓�u�@M��r�&@N���7��@O��bk��@P7��'�@P����~@Q%���@Q�ZaP0�@R(ǳ��@R��*\Q@S�D�\�@S��88ަ@T	uv���        ?��e~�.k?�JA�{\?�0J�g?�3ʍ��?�6esAz�?�R���t�@�i,T@
��& B@���\�]@m�60�X@dH�q@��wW�J@ �D8��@#	v���@%������@(MԨC�@+"�K���@.��)Y�@0��m�ZP@24��0��@3���73@5��m&R�@7d�z�5@9=ʖ���@;%*B1�@=� �A@?�19��@@������@A��Y���@B��]� *@C�Ӓ5C@D��@��d@F'T�J%/@GW2���@H�;`�ܺ@I�V���@Kl^�>�@LSe_٥o@M�)��L@N��*�Ü@P&��$@P�.���L@Q�:z��a@R<�8ٯ@R�W�3O@S�VZ��@Tj�'�@U*����@U��2at@V���YV@Wv��RY@X>�¾G@Y
d�BP@Yׇ0C��@Z�D4U�P@[y@ ���@\MtkC@]#�y��@]�k�o�@^�!�Bq@_��k9>@`Is6{&�@`�����        ?��$��??���?�T?�����?�L��P�?�(�e��?�J�瓪�@��ۍp@
��t�j�@��"DB�@��0	D�@���ؿV@Ҝ�6@ ��^uM@#.�{��F@%ɘ��J@(�	��10@+l9�|�$@.r|�`=I@0͙��#�@2r�k�qM@4(�4��H@5�'eQ�@7Ŝ[Ӝ@9���ñ@;��S��f@=�r��l8@?�*l��f@@���O]\@B	@g \�@C)�k��@DQ�^��@E����5i@F����Z�@G����@I7V&FM@J�����@K�A5�j@M+3�>�@N����g@O���@P���k�@Qe�HW��@R!���P�@R���J�@S����J@Th"��� @U0D��I�@U�]���?@V�d�eV+@W�SѠ@Xn!��G�@YD�#'�@ZK� ��@Z���ci@[ٯ~�� @\��8Y�[@]�:K��@^�V5q�@_qE��=�@`.��	�@`��:G1�@av�E�@a��Q�        ?��pn�%Y?�l�����?�ś��fO?��A�(!�@쪈Ic@	h��v@�I�*H@����@ ��r[1@ `�,mz�@#z�}��@&�{u)W�@*O�%�@@.ԙ��@0����1@2�zƅ�3@5�/�C�@7O;F��@9�jCS@;�N+'i�@>_#�"��@@o�H�P�@A��X�@C
�/҈K@De|C��@E��&m�&@G2�x�Y�@H��S�|m@J ��ΊM@K�%e�^@M-M*{ʜ@N����k�@P+���@P��ab�	@Qϕ�OQ@R���&��@S��PL@T^���@U?�I�O�@V$2�q$O@W�#�߂@W�T_��@X�t��y@Y�Ѫ#�@Z�����@[�L��@\�ݬ�Z�@]�[U��E@^��ˍ�
@_�D�Mf�@`Y��O%K@`���`��@a`�{ّ[@a�hq���@bm�h<�@b���|��@c~
�@dN&Sy�@d����>@e Y�l�f@e���).@f=����@f��&�        ?�8o�v�?�E<��.�?�m�U¬?�LB�{?�j��唁?�
_w��?����@��3��j@QG��j@u.�T@�@�"��ƺ@w;ZB�@�Z���@�GT�!r@q=c�#@!�;%E�@"��LGP@$�����@'}��G@),	A�cb@+c�=�o@-�*�%�@0p�]5@19f[�ǝ@2w�ޯ\@3�[��4�@5�s�@6c��s=n@7��fϜq@9'��zdg@:����:@<	�A���@=�`>�eE@?Qu��&@@I ��|g@A�!��K@A�Wi�=@B�v4{�@C~�f�O�@DTp 8@E-06�x7@F	�Yg@@F���s{�@G��<!��@H�ȧlَ@I����@J�X�?��@Kn�WH�k@L_h���@MR�hP@NH��M�@OA}G���@P|���@P���6�<@Q��G�@Q��v�h9@R"�˒�@R��!*�@S,cRd�@S�=���@T;��@T�+G�3�@UNx���        ?�K�\�z�?Х����?�r<�i�[?�֬�y?��Xd#�@ G�4@o1��d@��g�@4���`�@���b�5@���+@v<��d@!TAz�_@#�l=u�t@&CtH��@)���8@,�uw�q@/�ȼ��@1)D�a��@2֬�R�@4��v��1@6c^���/@8B
qu@:0�8�B@<.��r��@><���z@@,UB(�@AB٬�N@B_$g���@C�p�0A�@D�ۣ�YA@E�K��>|@G��@HZ�O)�a@I��[� ^@J�\KN��@LC��x�@M�(� �H@N�3g6t7@P3H���@P��.h;@Q��]n&�@R`�=n&G@S ��?d@S�����@T��g�=@Ur��P@V>���5�@Wxp���@W��2�@X��`�y5@Y��c��@Zd����@[A�|�y@\!l�'�;@]�Zĳ@]��y��@^ж]���@_�1��W�@`T*	N~a@`�
�fx@aE7�i�@a���V��        ?��� ���?ϛ�Υm�?୨,���?�s�^��?�Ȕ�P?�����,@��rt�@
v�F��@�Tx��@G㕢/@Oٴ
[@>e���@ `��Zs�@"��CĂ@%Q4��@'�k��y�@*�ߐ�mN@-���� .@0hRoγ�@2P`���@3��O�@5bM8�n@7)�dF41@8�鮎�@:乇A��@<�ׄ��@>���@@s���@A�;�,t)@B�%�b}�@C��t*�^@D�gfo�@E���λ�@G+�]��@H_�۷��@I�1���@JڪX��@L �=6=�@Mm���@N��A�/@PB0@P��j3S�@Qj�S�L@R�)�ͤ@R��m��X@S�I��q@TIãw��@U��6�@Uȳ`t�W@V����@WQ�<�>�@X���M@X��C��@Y��;�;@Z�*�kK@[QBO���@\$�/��@\�ՂB�@]���L�@^�MŚ�	@_�Ӓ�'�@`4BC�]�@`���y�a        ?�u�M��?�/��
.?�1h��;?��*�ܰ@�#asn@	;9��:@��ZbM�@��1��@�?_Ԕ�@ ]�S-��@#��ʽX�@&�J{C��@*q�r5U"@.;r;�H�@1Z�{&�@33�*m��@5cL�ג�@7�¸O�@:l��5@<z�\=�@?u$�4@@�{��=�@B)a5K�4@C�-aD(@D�����@Fn�2�Z@G����vp@Iu�ubbg@K⳻�~@L��]m�@NBѳ��A@O�k��'�@P��	X@Q�����@R���]8�@StI �w�@T]h�k1g@UJI�KS@V:��a�@W/	�0�@X&�hRͽ@Y"����@Z ��H@["ËR�@\(!�b<@]0�X��x@^<�6�L�@_K�ۥ�@`.�0���@`�y�g�s@aE�8Hd@a�2�A�@bbH;P��@b���s�*@c��ي�@d9Du�@d��<q�@eCJ��+@e����I@fs�*@gO�t8�@g�	ۼu�@hG�9�-        ?���V�Ht?�%�o�-?�E����?���%�?�f�ت.=?��o$g�?�_h'�@��+y9@VH	��[@H{d\�@Υ<y��@��{MN�@��
�Ĥ@ޥ��@8k�"��@ \�X�-�@"0�8�-@$��as�@&�͓��@(�5 &B@*2Ԫ Z@,\�R���@.�j�~�@0p�R�E|@1����@2�ױ��@4�!�N@5P��Y�@6�g��28@7�0c��@9B�
!@:����S�@<����i@=p�J[�.@>�>��@@,��D	@@�ơ�\@A��5��"@BrQ5?{�@C9�R<@DI���@D�l]��@E�C�zR@Fs��@GH�;���@H ��@H����]@I�Q��a1@J�c��@K�؀x	@L{�S�L�@Mały�@NJ*�@�A@O4ϥ�bS@P��EKx@P�^Ŋ@Q ��;�@Qz�qi��@Q�dņ�.@Rq-�|@R��*٬�@SkԒ�;�@Sꬲ�_�        ?�s���?��F^�?���C?�xWƧ?��	3���?�����`@��Q��@
qN@�^@6�*<@g�`X�@�[��2@8h�[@ ]Oy^V@"���s�@%L�t�F@'�G2�H;@*��R.n�@-���J~@0dv���@1��z�@3�9�b�@5\�\�J@7#E�m*�@8��	�T@:ܼ0�2W@<�y��@>�Q��bg@@n�	D4�@A|�h�4Y@B��21H�@C����@�@D�o�#�`@E�2]��@G#*��u@HW?F�@I�V[_��@J�ZR�@L5P�C�@Mb�'��@N�/��~@P���n@P��Xy+@Qd���VG@R;w'�A@R�yѡtB@S�S�R��@TB�ՊW3@U �ܕ @U�/C��h@V�E@WI} v�@X?��@X�[?�x@Y�� �[@Zvy�3�@[Gj5n@\�U�&@\�����@]�W�9��@^��%sE�@_|�D4��@`-.M�.@`�+���        ?��a����?ϝ�C��}?�fd�S?���[?�Є*�4�?�ͷ�@���V�C@
���m@��}@* �AD6@p�G��@R��@ l�hw�@"Ԝ�v@%`l�-^�@((��}�@*�I��@-�6���@0r��q�@2�č�@3�����@5m-U���@74����@9
��j�^@:�#��4@<���v@>�^^�*@@x�N�3�@A��Sce@B�Z��|@C�����@D�a�V��@F �L/s�@G.�����@Hc�`��@I�cCZH@J�8מ��@L&&-�@Mr��?�\@N�\���@Pڙ�x�@P��{u�@Qo��[W@R$M�s��@Rۧԑ��@S��{`�@TR{�ҋ@U�6�Mj@U����@V����@W_��%@X)|F�@X�����(@Y�v�:�@Z����K@[iISSL@\?T3N�?@]�"�Z@]�5|��@^ϲZ��c@_�&���@`Hr!���@`�s��        ?�UqǋP?�?$��)?�1	Ye?���U�x@A�!��r@PJmvy@:�+��@�M��p@�q}CR�@s�8@"�9��s�@%�+\��@)S��m�@,��Lo@0XE4ؼ@2Q��¿@4`y+q9V@6���@8��#w��@;7�C�@=e�=(@?�W��u�@A,�B�ψ@Bv�1'�G@Cɲ�#@E$��E�@F�}D{j@G��F�w@Ig�4ΦG@J�ڏc:@Le����@M�ũ��@O��8;j?@P�H;՛@Q]7�GȽ@R0�%r(x@Sa5q��@S�z[L+@T�Ԝ���@U�_w� @V�
l���@Wi�,�6�@XS���$�@Y@4"ݸ@Z/��	�Q@["8\�>�@\sj��@]pI&J�@^
$<��@_�$2Mw@`�F���@`��
��@a�y���@a�b����@bk�@b���Ν�@c%�u7{@c�яQ�@d0�\P�D@d���@�@eG��)�|@e�9�(��@fc��(��        ?�T�4?�66���?�ix{��f?�$���?�^����?�޽��?���9%86@<ނ�Ͳ@	>�G�@K����@�3ת��@�#.c�@ 1�tb@w=p�@����@!PM��O@#8��$Z@%2�U>��@'?��X�@)_`ls@+��s8�B@-� !���@0���"@1DM� @2~A�p�@3�3�7l@5	����	@6[~>�I?@7��BB(�@9�_�N@:|��e��@;�u�8�@=as{���@>�;椘;@@0�PHj!@@� ڒ*@A�d)�w@B�P�%[@CX�m#�@D*�!ף-@D���cT@E������@F��7��@G� $Q�@Hq�X�v�@IUȔ�[�@J<o�t�@K%��T��@L,��`@M �2xM!@M򅐳tL@N��=i�@O݄p��@Pkn-5M@P�\Y���@Qh�����@Q��=:�|@Rj��v�@R�M��.G@SqI	Dj@S�rĴ�@T|�A���@UKu6        ?��V�0~�?�'��YQ?���H�dE?�����?��ּ?�H��+@�%�	�@
��As��@��^G2�@UD��x@L+CKz@�h 	u@ �$�T@#��#a;@%����@@(Oq`M@++��ւ@.)&\& @0������@2ET���@3� d��B@5���K�@7����3@9h˫w�@;W�d���@=V|��7@?d���@@�1j��w@AՌ�0��@B�UO[�@D���N,@E?�*
-@Fq5ƍ�@G�5�C�@H����ƾ@J-��@Kx�ƣ��@L�����;@N#\w�L@O���I Q@Ps�.�@Q(c�k��@Q���|,@R�֟�
�@SY�R!{@T�ߕ�@T�|p��z@U���]>@Vn�t<C@W9���b@X�s�n@X٪��0@Y�g�$<�@Z���(��@[\��ⅈ@\7���1e@]�U.�@]���IC@^ؒ����@_��ُ�g@`Rh�6@`�Z3�U�@a=Z���A        ?�!�蟵!?�&�H�	u?�s?�/�0��?�8�Q�?�Z1R�b�@����@
���޽�@�y��@y��d@t)��]@�0�=b]@ �Qy8�@#<v�@%�ku݉@(e� �@+?:�П�@.;M04��@0�A�d(	@2K��!�@3�ڈqo�@5�;�挈@7��J�H�@9b��g"@;Njr�u@=H���p@?QD�Ȝ@@���t@A�Y��?@Bߊ!2��@C�zi���@E&פ�@FS1�g�4@G��Z���@H��"�U@J �d�}:@KGH9g?�@L���:;�@M�%rb�@O>q�@PNC��]@Q &ќ�.@Q��G�Y[@RlH�0�@S&o��W@S�@7JK]@T���|(@Ud�&R�L@V)EI�e@V�V/%ä@W��t�3@X�Ղ3^;@YT2�䂑@Z$쮋�r@Z��%�]�@[�TKa�N@\��n�T�@]~�|r@^Z�[!��@_8��^@`�"B�@`}����p@`�*j�I        ?�0>���?����/?�O���L�?�6�&�[@i
?]��@	�!�Y@QE�TI�@90˒��@��N�@ ��䘩�@$��]O�@'s��d-�@+�v*��@.��m�W�@1�?����@3��v�F9@5�I�m�@86`�n@:�H���@=g$W�O@?�0ý��@A.��%�}@B����@C�d�/@Ej�v�nS@F�����@Hn��%@I�w���@K�����@M9�(�!�@N�i뙙�@PK�7.�\@Q)�J��@R��o�x@R�%;�63@S�J��@T�\���@U�H
Z֞@V�����@W�k"H�^@X�~�z�@Y�'�T8@Z�X^V�@[�09�@\�"O��@]΅M�b@^�B��/@_�?idW�@`��T�@aax= @a��{�-�@b4S�N@bƏǺ�:@cZD+�X�@c�i���i@d���(@e�Ӂ�j@e�;�%�@fQ�xǡ@f����@g�}�@h)��	�@h�q	U�^        ?��ce�?�a�m�aC?؂�|��?�������?睊wP1_?�9�lU�Q?����΃j@����2�@t(:T>@h	� �*@�V0O@��3�u@�����o@��N�-@R`�4�L@ l&���@"B�{�ˎ@$,xN��@&(�R���@(7$4���@*W26��@,�^V�b@.ʪ��@0���� �@1�%줫�@2�����{@4:߃WD�@5��Lw��@6�xa8�@8,��gly@9�zT�@:���x@<`Օ�4�@=��1�@?R=:���@@j���{�@A/����@A�S�UK@B�6���t@C�p�Q�@De�"j*_@E;�oq� @F�{;C�@F����C�@G�Lj���@H�����O@I�=�e@J��扄�@KlJs]��@LZĭ�"@ML+-{��@N@uB�y@O7��}P�@P��ʜ�@P�'�}�/@Q���K@Q�;��X@R}4���@R�L�A�M@S#p�G!@S��7�|@T1�p��&@T��.H e        ?�|��٘�?��l��?��Z	��?�w��CC?���/bz�?���<�5�@�U4, @
#��g�@��uE~@$��J.[@���Y @M$ͻԻ@ jb�	s�@"�Y��	�@%`��&�U@(5��#@*���8�@-ٷ��@0x�]�@2�����@3�O�7��@5z���@7E�I��@9����@;	#cJVx@=?X8��@?��p��@@�����@A�Q���K@B�X�ܞ@C�Ʌ��@D�\��<�@F,�-��@G`��e�S@H����k@I��{Ek@K$�}��@Lr�pr�@M�$�J�@O!�&��@PA];�@P��/tr@Q�]�+a�@Rd��>�Z@S!Lds�@Sॷ G*@T��رI@Ug��ݷ@V/�P�E_@V���q@W����@X��Ql@Yj�R��@Z@w��o@[���M*@[�f�;X	@\��~��8@]��`&�@^�3�9�u@_x9w?�`@`/�)q:@`��,��P@a!�?e        ?��108E�?ϙ}_��?ాJ�?����d-?��{���?�ч���j@�)(��@
���r��@���@3��b@$�h��\@f+���@ zGm+�@"� Ή��@%x�[i�|@(.r��@+g8��@.�N��@0�:m�8�@2/�����@3�j�U�k@5�D�wm�@7n�O݆@9N��v
@;<�Y��@=:r�WR@?FFN��@@��
��@A��34�@B���f�-@D�S�o@E,g���$@F\p[B�@G��T>@H�H["@J��D@K]ޣU�@L��9p�@N���@Oa�*��@Pa��MQ�@Q���2}@Q�&m|sX@R�/����@SDc�y�@T�����@T�.Wڂd@U�Y��?@VS6T�\.@W��r��@W���'(�@X��
wO@Y�	j�c.@Za�t�:F@[9X!��Q@\?u��@\�Ԩ�@]�l�'Kp@^��d��@_�>Mō@`<��r�@`�����@a&A���        ?����A�?ٻb���?�VOh�?�%W 1�@�Au(�@�uuf�@������@O��Ȓ�@��9�a�@ $yYy� @#?NVs��@&�]^��@*!Q��w@-�
��B>@0�O}j�@3����@5.O���p@7r�_2i@9�ƫ�2j@<?fD�K@>��/&�@@��)@B
�GCc@Cn="�D/@Dۥ���@FR�Z*�T@G�k�r�@I^����@J���k@L�J�7@0@N6��*�w@O�y�g�@Pρ�@Q�,wYM�@R�1f�e@S~����@Tl�/�X@U]�J�9@VS����@WMÉ�[9@XK�s�}�@YM��`i@ZS����@[]��{LK@\k����n@]}Z���@^���+�@_��� ��@`dl��>�@`��}�>@a���k��@b�08m�@b�X�b��@cG�1
�c@c��\��@d{���@ej�@e���)K@fV�~�7�@f�#a���@g�L
�|@h@3�5�@h�^{r�v        ?��N��?���z;��?�R�?�cS���?�<Z���?�֐S_?�sx��ZG@�-;�X�@A��yƽ@o�/I�@�)�/9�@�Jy���@��֤��@B�@�K@�N��mM@!$���:�@#Ok�@%�D��@',i�[j@)U�/2��@+�fa:�@-�f�;@0%�GG�@1WN���@2�җ�d@3��)�c@51.�[ d@6���ڂ.@7��7z�[@9Q��F@:�τ�r@<7Z��@=�(W���@?:"k�2@@cY�-@A,�{㣦@A��E�,C@B���ꙩ@C��s�>@Dt�����@EOZ+f�@F,����@G�Ddv@G��oG@Hغk4�V@I�q��Q@J�`�"-�@K��>k��@L�>LG�@M����~�@N�
�P�@O�SĚ(@P?����@P��t֟�@QC*P��P@Q���;�S@RL'��z�@Rҳ�Z�@SZ�{ܿ�@S��7ye@TnY�ڋ�@T�-��@U�H3�        ?�h��2JV?����R?���	�3v?��x��?���4#Y?���+�Q@�R�-�c@
w��A<�@��}d@P���@-���@7bqK@ [MB9@"�g���o@%F����z@'���:�p@*�~���@-����@0Z��>�u@1����@3�y�Q	I@5K�-�@7j�!��@8�F�f��@:�[���@<�dj[<�@>�%�&-@@Y��+6@Ad�6��x@Bvqh���@C�m�!D@D���/�p@E��R�@F�iƍ�@H+�-:�=@Ia�1�<@J�����Y@K�h��2@M&���T�@Ns0�r��@O�8҃�@P�Hf��:@Q<�l��@Q�sqA�C@R�ޤ�|@SV�IM�@T/����@T�<E�@U�<M��@VF�֭��@W�{�X@W���#��@X�V7>�@Y[�(�S@Z&Šث�@Z��L@[�����9@\��T��@]g{�}�@^<CS�݈@_u��@_���-@`c�US�R        ?�%�sn?�7W��"?��۱8�?�`(cQ�c?�c���**?��i�l�5@)�d��@;�pB6�@��#O��@����$U@���b�/@5�w�@ ߹��'p@#Y0� �@%��1W�@(��CZA�@+��T�@.��r^;6@0��nO�@2��Gg�$@4A~G>��@6��ױ@7���]
@9��ܩ�@;���@=�`;��C@?�7���@@�����@B�ae�@CP<�sK@DBT�@��@Ek����e@F�!�##|@GҲ���`@I�X��
@JR���c@K���z��@L��=��@N@:u�Ԓ@O�8̜]{@P}�7�4�@Q12	��@Q�3���@R������@S[s�g�@T�����@T�p̑h3@U�ᚔ2�@Vc�x���@W,�\|�@W��Oʕ@X�=S8i�@Y�Mİ�
@Zg�[�"�@[<��w��@\юq��@\�RaWA%@]���j{@^�(�5.@_�o�:��@`4�߻��@`�G�]�a@a��?�^        ?����x?�M�ڜ?����?���u��V@ #%��@	`T��@�r�K�@�e�@��Y,@ v�e�@#��L��@&��E�(M@*���p�q@.c�l�@11�K�L@3I��`@@5y�2�m@7����Nk@:���uy@<��G>�@?*�Og@@�g6h-@B1&$��w@C���38@D�xt��@Fq��\X�@G�J �@It�ЫD�@KZ�n�@L��c�*|@N:��!@O���,@P�����@Q��mh @R��^Q�@Sh�p��@TP���E@U<0c��@V+�#�W�@W�fY�@Xk��@Y��abJ@Z�E��@[qR+W�@\��t:@]"���@^)'e&d�@_8� ��@`%�h�(P@`��=.��@a=k|^�@a˺w���@b[�+!� @b�V�@c�)V=n�@d�]��@d�����
@eBj��B�@e�|��՟@fv	"�@g�F�@g�c�cS�@hN3	        ?���E?ʬ�捚;?��^���?�'�o��?��:�G�?��Â.�@ �����@�g��@
y7
r@a�����@��Ջ*@�\�i�@��O��@?/�H��@��
~�@!���̆@#��J@%�u�$U@'�d��'�@)�cf���@,n�Y�@.U�5i�@0TQ�9�`@1�}�n�@2�Uc<�d@3����6@5Fz���/@6���Y�@7�o<s�@9H�8�)@:�)�_��@<ؗ�;@=���a��@?�"�"8@@@ o�.@A|G'��@A��VKx@B�cڲw@C[ׅ's�@D*=.*�@D��3��@Eϭ�e.@@F��/ 0@G�_
eD@H\�(�-@I<��t@J��ɥU@KF�d@K�O���5@L���o�C@M��~1@N��?&�@O�����@PI-���v@P�1��a@Q@i_��@Q��c,��@R<f�x��@R�%���@S=
{\�O@S���/@TB4@h��@T�p���        ?���"���?�(�h�pV?����qUM?����?�a*~/�;@ }#�iR�@�xI�W@\�o4�v@�k�U��@�u��@��'s��@E�J��@!���oA@$"����@&�?��C�@)�@�]�@,�<o��P@/�h�v״@1��xƊ@3S1�C�@5闺�]@6�[���#@8�?J��q@:�Mw���@<�?��%@>�Ͽh��@@����M�@A��5�}@B�B���k@C��F�
�@E.�����@Fg�t�u�@G�����d@H�i`.�@J;構F�@K���\�@L�ŴO.p@NK��-�@O���0r�@P��_��J@QJ�?1c�@R* ��@R�{ �F@S��Fi?@TR9�QX�@U�R���@U��LX��@V� ��H@W�=�tOR@X^4y��@Y5��l'd@Z�ֿ@Z�����@[��{��@\��$���@]�P�.@^~��@_h��Ï@`*��{�<@`�޷��p@a5{�@a�m�.��@b߀R�        ?��!le�?�R&C�1�?���%<<?�R��]�?��'K��~?�P�8��o@��\b"�@	,݉��@a���t)@�K�@�&c;��@��9�@��p��p@!�D�}�d@$!�h�@&�[X���@)@*����@+��^���@.�	<��@0��H�ҝ@2n@��$+@4!f�%@5�S�~@7V�1��@9,�k�c@:۳3q$�@<�.�X@>�Xˏ��@@=���^i@A9V�u��@B:*a�@C@U�!\�@DK�YV�9@E\Iq5d�@Fq���8�@G�dǮZ�@H�ǂ�m@I��U��@J������@L&?>�Ƹ@MX=��0�@N���D��@Oɑ�^,�@P�ay�@Q&A2�@Q��,�w/@Ro�ޙ�W@S�J�Lj@S����Y�@Tm��{�@U��#�@U�hYfB@V},�"�@W0���;@W�a4<Ed@X��3��j@YWoL�e@Z�4F�@Z��62�@[�j�`T�@\M��6@]��p@]�;�@��        ?��Krzu�?ڌ�#��k?��]�[}�?�ڃ�&_@!UyG�?@	���@���Z}@���w�@)�7��v@ {��c�@#�&Ɲ=@&�G�z?h@*�^eJh�@.E ��}<@1/�x�@3*ȴyc�@5P��9@7��K	��@9�d�ێ�@<Bg�9P4@>�)��CG@@���U�[@A��-�`�@CKks��@D�ڠ��@F	�~�@G��h�
�@I�R�@J�E�7`@L�ȸ�S@M�[Zv�@OB����@Pr]6B@QGg��`�@R 8(ʂ@R�\����@S�&�5�7@T�g�H��@U��]7�@V�\�@W}q_��@Xn���=@Ya����@ZX�I�W@[R�^�P�@\O�i���@]O��W@^R�ҚZ�@_X�Ǹ�t@`0����}@`���de@a=�����@a�0�=U@bP�$�k@b�N�;��@cg���~@c����i4@d���_B�@e�Y\�~@e�S��@f:j�{��@f��U��T@gdb^�c{        ?���~�x?ȩ�ȇ��?��]l���?��V��Y?�^�K?�k]�ⵆ?�'gI@��s$�@���di�@�����@�Z(u��@Ɂ'�
�@�^ 8K�@[�٪�@��%c1�@!N��`�@#>����@%B�m�@'Y�ك�@)� Oq��@+��C��@.�����@08��]@1q	.�S@2�v��.~@3�6䐸@5N���@6�a�P�@8	��9�@9sL�5�@:�nS���@<]FC�@=�(.E�[@?d��X��@@y�w�2+@ADx�V�$@B�*�M�@B�с�*�@C�8���N@D����@EoVXO�@FN��#(�@G1�t~�@HM���@I���|�@I���b�Y@J�����@K�3D�@Lȥ��W@M�8$��@N���˫@O���zF�@P`�4���@P� �|@QhퟯK@Q��p�@Ru��f\@R�;Hݹ@S��q'
�@T˥Ӽ�@T�2���@U0����@U�(ؗ        ?�]����S?��m��t?ᛙq���?�!�1ԅ�?���In@ 0��@����I�@���R�B@h`�R8@7�B�j?@\�R��@ճ���@!O���t�@#܆�uX/@&���`@)i1h�(@,g9wI_?@/��319�@1gٽ��@3N.�@4���*@6�T�m�@8�S�|�j@:�����@<��Tat@>�(���@@m��7{�@A��	�p@B��H��@Cհ���U@E2�Ȅ@F@�h{@G�I"�(@H�?���@J��HJ@@Kj�I�@L�nD�2@N*#�JӉ@O�(-I�@P�`��Ӷ@Q>��@Q�xAMW@R�o���@S���YR@TM�,��@U�Ǻ[�@U�1�b �@V��<t|�@W�1�|{v@Xi�1�:@YE�i7�@Z$�ڭ��@[r�'�9@[�]���@\�D7��t@]��n�@^��Q�R�@_��K��@`H����@`�G��/�@a?�7�F9@a��7�@b=k�]h�        ?��7����?ϧ���X�?�@��d�?��sNN?��0ψ�(?��,v� �@����z�@
�bĆ��@��Ptb@+�sS`@��Q��@Sn@纽@ l�l٨@"ԛ�Oi�@%`���@(>e�,@*�W�w�@-ώ�M-�@0p�c�b@2	<�R>�@3�po&N�@5h�96Y@7/CěL@9LQ�@:��r�@<�?\3 �@>ئ��K@@r�_��l@A�%�@B��Ue@C�H	�y�@D�����@E�5���@G#a��N�@HV�̎��@I�B��I�@Jϰ��@L�qNH@M`tW#�@N���?@P�\N�@P��A�O@Qb�g��@RP�@R�R1qh@S�3q�o�@T@�i��#@T�ɿ*cW@U�n��:�@V��B%@WHFE�V�@Xk��r@X�~.M@Y�	�2�C@Zwu\Û�@[I@`�@\c����@\�د\V9@]̘j��_@^��kV��@_��fE��@`2'1��@`��L&/�        ?����2��?ڞu���?� �l�&�?��=CC�@=#@	����R@.S�+��@Qvl9@z�P@ ��U���@#�;)��@'X_�͠@+ ���,�@.�[N�@1y��jG@3�)���o@5��_�a�@8,V�s��@:���A}@=��N��@?�W��@A-*��7-@B��G�m@C�>[@El��,�@F�z4�$@Hs��hjq@JhS9{X@K�u�e(@MD���y@N��7L��@PT�=Pc@Q3����6@RZ�c�,@R�p��<�@S뿯b�T@T�;��:�@U��0��N@VɗG�e�@W�d*;�d@X�:S�P@Y�ק��@Z��~ɠ@[�V���@\�X.Y?@^���@_Z�=�@`΀���@`��AV�x@a?��55@aӄ����@bi'5V_�@c �S���@c��?2�@d5k_G@d�ﭹ@ep�ܸf@f���
{@f�Y��p@gV�����@g�UG�zn@h�s$X=@iL1���        ?����B�R?Ȑy(R�?��C[;?��D[�T�?�^Ԟ��?�_���?�?���E�h@���e@�>�� @��y1�g@��� Jj@��b�A�@�r¬0@J��<i@ҥ���[@!B{�N�
@#0''��v@%1�דo@'F���c�@)n��<P@+��s�@-�P�*��@0)�7�/�@1aI' y^@2�Z"٧�@3鬍���@5:ޤ�@6�h�c�@7�-O��@9Z/��7�@:�W)�3@<?� ���@=��@?B>�c��@@f�]�G�@A0=�yl�@A��
^з@B���ԉ�@C�����"@Dv0���C@EO�*-�q@F,K�U�@G��w�-@G��IE@HӋ(��@I���5�V@J�0�n��@K�R��l@L�K�>Br@Mz�K�2@Np�4QC@Oj�(E�@P3TnJ�@P�o�0F@Q3'�X��@Q�1�U�o@R8��\�@R�#��@SC�c��@S�!2Vy@TR{y���@T�ٰ��@Uf�|n	        ?�z���&?�
b�!��?���1@?��ыK�k?��x�hR?��L�,�@� �׬@
��`O�@�/��@-$b�|@���ҍ@R=j�@ kB��m�@"�ժІ6@%[�`C��@(]S&p�@*֎Y���@-Š�M��@0jk�Y	T@2��B�@3�{��y�@5^N���@7"�'۔@8�ܿ@:׀���@<�� �&�@>��g�@@g]�Ω@AsX݂m@B���;�@C��{��O@D�#!μ�@E�BrH@Gg���@HA.wc�@Ix�X8�@J���eN�@K��y�@MCDk�J@N�$۞k�@O枫���@P�O�f��@QP
&d�@Ru��߂@R���PM@So:u̵(@T)�K�g8@T�X��@U��2ݯ@Vg�%F�b@W+��X@W�b�R@X��=QN�@Y��֩B@ZU���E!@[%�i��@[�}�v5|@\�h�$	@]���(��@^}� 0�@_Y��� �@`��S�@`��
��H        ?�7&��P?�O��[�?�;XH:��?�"LJ�?���Ť�r?��t��)�@K��FRb@g>7+l�@Rz�Q@�4��UO@����@I*G�e@ �˨ _U@#{s�I�-@&�,�@(蒡�9�@+�s�Ԛ@.啕2�@1*Y&�@2��Tv��@4q�YO;�@6=;�l]@8��X�@:��q�@< Q �Sd@>YT��	@@֤�@A'�uO�y@BC�a̾@Cg)؉�n@D���*D@Eú.�+@F��7�z�@H<{�^gA@I�7@��Y@Jм˻�@L$�Gu1�@M˞�}n@N�.��/Q@P$�2$y�@P۩� ��@Q��J���@RSoD�f�@S ai��@SץA���@T�Uw��@UhA�֋@V4�|F@WP�ٴ�@W��#�N�@X�2�k5�@Y�f�@Z_e��K'@[=*��@\���>�@] �E�)@]��F�t@^�qE�_@_����@`TLh��@`̌�s��@aFbj3@a���'b        ?�+�_ο�?���?�A�9h��?�+L��B@`�3.Ʌ@	�@;�n�@JbF��@0��_ß@��)),3@ ��`!�s@#��Y4��@'k�X�@+��S�@.񷒑�)@1��S� �@3�q�,z@5�F_�@8.b��D�@:��Bi�@=�4�@?�|􁾠@A'���@B��V���@C��e��@E^D�� g@F�3ٚ��@H]d狽�@Iꧢwdy@K��)?h@M���@N����@P;[u�k@QGE �j@Q�0�˴�@R�|~"{@S¦떖�@T���R@U�%�A@V��&�Vt@W��j��@X����=@Y|�+n�@Z|���@[���$n�@\��g~I�@]�ΒJ�@^�)�?�@_��ŵ�W@`a����@`������@ay�x��@bg�#^@b�����@c)	�̟L@c�����@dO�i{�@d�1�I��@e|{�?`@f9�bX@f��M��+@gH�:�I@g��0��@h�q��W        ?��4B5�?��&?�4V8�[�?�P��w?�Z����?�	Ia�?�\��ڛ@�?���2@X�P�d7@N�9�3@�+=��$@�Uu�5@�S���@�-��T@E��@ dK�e�@"9,*��@$ [c�o�@&�W��@($��W@*?���~�@,k���S�@.��,�1�@0y�-9Ŗ@1�k�p��@2ܝy�@45����@5]���>@6��c�@7��Z6�@9R�ՎE@:�k�7+�@<�сy_@=�5T�H@>�,bccT@@8����F@@�M^��F@A��u�g�@B�s�m#�@CH�R�á@D �5S@D�-�b�@E���t;7@F����e@G\����@H5���b@I	�13@I����@Jϱ�)O�@K��N,"@L�Y�\�@M�Y���@Nj����/@OW�2Q��@P#MZ(�@P�c`��@Q�aA[?@Q��8�0@R�^s@R�,ڥF@S���@S���+@To�5V�        ?�"�G	B�?π��p�J?��.k��?�CBZ�#?����͞�?�YҎ��}@ML9�z@
Bݍ�X@I�m�C@��r�>@�x��@ۗbOq�@ ',7���@"���`�R@%u�N�g@'���m�@*m����@-Se��.e@0,̿o�_@1��,"@3bP�I{�@5,�j�@6�c3Ϣ@8�Ƭ.g�@:�ͺ��@<o��A�@>j&��h�@@9J.�\�@ADN�9�@BV��@CnS���@D�!K7�@E�S��%�@F��<cR@H����l@IGIh1�J@J��;H�@K����B@ME��K�@Na��_@O�q��@P�vh�]�@Q8qhtև@Q��x��@R�sOip@SXd�I�3@T�68A@T��Jf�@U������@VQ���[�@W��DG@W���@X�W�o&�@Yr��@Z@��֤@[g�q
@[��a9�@\��$���@]�(���@^h}?�@_D<B�,@`�;}�@`���tl        ?��I�|?�*`؂�?��V��S?�O_���?�W�����?��\�w{�@���#~@.��M�@�;�G�@��:۟@@��ڹm@K<,>g@ �����@#Sa�ꙇ@%���#�N@(��/�4@+�*��T@.�^��,@0���e@2�EK]y@4E&�dB�@68�(Y@7�8Er-�@9����2�@;�5w�@=�WO�x�@?٦9ݤ@@�]r.@B.D�V\@C7,��#@D^>�a��@E�L��>�@F�?�('�@G�%|/�@I?�7��C@J����1V@K�c���p@M.���-$@N�0՚w@O� .�A@P��5>�@Qc?�]�P@R��39@Rې�!n�@S�)~"��@T_�F6�3@U&�zT@U�4NEL@V�,uds�@W��x�@X[W"���@Y/y�I=@ZE7X�@Z߳�@[��}�f@\�V��Z.@]{}1��:@^_'o(F@_EN����@`�Q�@`�~g��@a<��V@a{-��)        ?����7��?ٌ�ki9z?���ޭ��?����΢�@y�r�)@��d/��@pB� ��@���c�@?�/�W@����@"�i�|v�@&;>Y-7@)�D�.@-W/��P�@0��T���@2�Z�L@4��#���@6��A�(@9"����@;y����@=�i����@@1"|��m@Ayk�c@B�����@D%2i({�@E�A[�V@F�����i@Hg�sLyR@I���G�@Kg����@L����j@N�~їW�@P_��M�@P��82�@Q������@R�A� /b@SlQ�J�`@TK�}n@U.�ፆG@V�G���@V���j�@W�L^�ʮ@X�I��@Y�m��@ZĲN�8�@[��/J
@\�}LKt@]��F	@^�a�`#�@_�Ʀ��|@`e
�/0@`�L��@aq�R���@a����@b���w=l@c=h�@c���?a@d)���VP@d��$�"@eI`?�
�@e�;��vj@fn]a��@g����T        ?���^}?��9�#�?�雯�K?�%ƍ@�R?��3g8q�?�{�W��?�0���@��7_�@��D(�@פO��@��篏,@������@�*Ę�]@)J�^�v@�p� �@!(�$¤�@#&��r@%G-���@'m�FF�@)>�>�9@+q�� @-�#16_@0�6:/�@1:��I��@2v��E�N@3��$�g�@5��Y�@6Z�1�`@7��@兀@9��PO@:��Ԃ�@;�P�#�@=p��.�@>�ϯnfj@@<��Q�"@AlK��3@A�m�*o@B����@Co���À@DD�a�X@EYsϻ�@E�+P�o@F�ģ
@G�=5�s@H����Ԛ@I���Q]@Js���t�@Kb���o@LS����@MH1�.�d@N?���9@O:!�,@P���&q@P��v��j@QJ:�y;@Q�+l�@R$m�-/@R�e��[@S1Ǯ��@S�O�(I�@TB���8�@T��^� @UZ��4�        ?�p�#��\?��V*!�-?��䉘�?�	sOk�?��rv-��?��|x��@�	,�R@
^C=��E@pz�GF*@�1�T@�Vp�A*@�~�W
@ D^��#e@"��,4h�@%&�KYm@'�G+s�@*���&�@-up�2�@0=j�By'@1ϔ��@3p�QW6�@5 ��z��@6ߖ�e�,@8�]��u;@:���{�@<oDB8�@>d�[Ψ{@@3�����@A;X�iF�@BI=�Nj�@C]@�{��@DwF*x�@E�1��R@F����@G�N�wփ@IL�0��@JOȜ�"@K��Q���@L���^@NLA�K�@O^�xxJ�@PWɐ#��@Q�i.�l@Q�4v�c@R_Ҧ4��@Sҝ��@SƽE��@T}��Ȫ@U7)�bA4@U��棘�@V��J�&�@Wq$gb�4@X3��D@X�h�j@Y�[�ߐ�@Z�}����@[S��V,@\!4����@\�)�T�@]�_ �|�@^��X��@_kԷ���@`!σoIz        ?���d�A?�u�7�?���L�?�x��6�?���a堿?��Da��@y�m��5@
U��,	@mi��E�@��y@�F�A�@��A��@ I�_̰@"��L�F�@%2�u�P@'�e.�#@*�C-���@-��s��@0Ps�+R�@1����@3�=-���@5Bآ4o�@7��Zx@8��4%@:�*��B,@<���>m�@>�B�7�@@\=���@Ai=�zұ@B|��@q5@C�E��Я@D�`A�@E�_��P5@G�����@H@�y	��@Iz��t=@J�� @L)fф@MME����@N�I�%��@O�%/�n@P�c��@Q\�i&�@R����@R��zR�W@S���^@T>��u@T�(%Ʊ4@U�I���@V���]e@WLl_X_@X]{J��@X�،nߑ@Y�ՕVq@Z�L�<��@[W5��:j@\-��M>@]C�s�"@]�[}��X@^�ɬ��@_��ة�H@`@E���X@`�g�O�        ?��P�8�[?��Ý�4?�$�{�c?�9r!	.@��y;�@���\�@��q'�j@VK�w@���u�@ "ж���@#9N���@&�!��hg@*oz�Ը@-��h쯓@0�>���L@2�A��0�@5�`f�@7H�3K��@9�ϰFY@<M�U6@>~����@@��h��@A���ke@C6
�po@D��S��G@F
�� � @G��O��@I���s�@J����ѝ@L �Iq5�@M������@O_�紷�@P�����q@Q`3�O��@R>{�F=�@S �"��@Tv��z@T�3�p�@U�:�o�@V���@WƫŷC@X���b/�@Y���4l�@Z��zt�v@[��!
ט@\�ENA��@]�_7�r@^��O�l@_��$�s@`�
ڟ��@aV醰@a�F���@b.�V�$�@b���@cRõg��@c�9��@d|�~8 @eWz��@e�@im��@fG��`��@f��*l@g�����i@h�ѽ4.        ?������q?ʍg�#?���=5ab?�%.{E?�ԁ����?����@ ����c@�?m@
�i�T@jzޭ@��[g��@���B7@��ƒ�@]�ד�@�z�Q�@!��9�X@#�k�I��@%����=�@'�ڠ�H@*�pǚ�@,S�=#� @.�NR��V@0~��pP�@1�e��"�@2���9C@4:Ln���@5�5y�V�@6ݎ���B@8:1=��@9���GD@;Ġ�L�@<zs=�
U@=����n�@?q�M�l@@{�J��@AA��	�@B
��=t@Bև��=@C�~X�1�@Dw_ˤ�E@EL!+��<@F#�TyF@F����@G�/ؐ��@H��H�]@I�jR�@J�s�si�@KjWR��@LT)D���@M@��U�
@N/�b��@O!E�j�@P
���.@P���C�@Q�k��O@Qi ��S@Q���s~�@R}�%7S�@R�~�"5<@S�e�"�&@T_��(n@T�i��m/@U}|�7X        ?��>mH�?�KV _�?�:��Q?�6�,b�?�9>a���?�W�,��]@�/ͺ;@
�wi/�@�׫+>�@v�kT��@p�@��@�qm2��@ �[��b@#:���@%�d�z{m@(b��D>$@+=$i��@.9��N�@0���.�@2I�,��A@3�g�� X@5��y�7�@7� U��@9`l�s��@;K���>�@=E1cT;"@?M	�L�7@@�py7@A�?;�s@B��-y��@C�{��@E �-��@FM3_wa=@G�g��+@H���]SM@I�%��U�@K=�yQ+�@L�;�8�@M�~�:Q@O1�2p��@PG�B���@P�»��@Q�{C�@Rd����v@S��͉�@Sہ�Oh�@T�
Ә�@U]J�j�4@V":��ڀ@V��/a��@W��d�@X��<�BZ@YPjL���@Z"w�$b@Z�D<' @[�9��@\���!,@]�)�Ox@^b�˅K@_C��k0@`��+�Q@`���h�@`��?ڗ        ?�$��?�.��S�?��Ӷ�?�H��i�l?�N+���?�{_{�- @�3�l�@D&_� @��ynG=@�]o(�@��dT@�ً�@ Ç��Cq@#8��+�@%�?H@(����@+s��ل>@.xB��>@0�m$7�@2sj�Kt@4'�s�<;@5�OM���@7��\��E@9��*��@;�� &Y@=�1O���@?�mi���@@��F2@A�܊R�@C3���@D@��5|g@El�x@F�(;��!@G� 3l-@I�q�߃@Ja�A�@K����|c@Mťb�@N^4o�pc@O����Z@P���k'@QIT�@R��估@R�<f4a@S~��MG�@T@�/m�Y@U�Q��!@U��jѢ@V����@@Wf<"r��@X6���:@Y	�܀7�@Y�F�9�@Z��A2 "@[��:$,s@\p[w�!�@]P�W�;K@^3o/ �w@_ҟ��@` `z*|�@`u�rj��@`�f��@ac�^�6l        ?��͍��I?�|.��3j?�ؼ�;R�?�Ѿ���@�yP�@	�ў� @v�R@�#�5^�@&[�Y�C@ zs�%�o@#��
C{�@&���"��@*���~8�@.Iz�_bX@1��Z@3/���.�@5X���@7�2!�[@9�7?�`@<Qۮ�@>��9�E@@� �t�@A�VS��@CY���I�@D�j�z?�@F)����@G�����@I~��7@J�K|#�@L0*�t�B@M��]⼓@Oci09@P�R�lZ,@QZ���@R4���6@S&����@S�<R��@T�Ȟ���@U���I݅@V�	���@W��~:��@X�y���@Y��"+�@Zx��Ւ�@[s�oP�'@\r2�V)@]so�VJ@^w�Yq~@_~�9`i@`D<��<�@`ʍ��P@aR<I�/�@a�B�r��@be�� ��@b�@�(`�@c~,R8h@dY���@d��D5�@e,c��]�@e�5����@fQ5!e9�@f�^^Y#@gz�gߥ        ?� �dMP?��9�8�?��رD�?�B9��{C?��O��c�?���1���?�f`��@��[@��x�N@�G��@�-͗{@���u�@� �K��@<��2@���(��@!,�^x�E@#�	M\)@%
�p�9@'͚��	@)1��Y��@+`_�s��@-����Y�@/��yo5@1)�v� {@2c<�q��@3���ܹ�@4���;@6?UTJA@7�U�t@8��z���@:a�Κ�@;Я`4xn@=G�ꯕ�@>������@@%����@@��S"�@A��$�W@B��p�T�@CS�.X�@D'�[1 a@D�b�Ƽ�@E�gp�R @F��?��[@G��(�@H���@Ig՚A��@JS`�t�@KB!c��X@L4��ٺ@M) h�@N!M/��D@O�S��@PnR:�@P��-@QDLc�@Q�����@R��cE@R���X�@S'�Ή��@S�A�^�9@T<.j�@TȂW1@UV9���        ?�n�� }?����QU?ऱ�
n?�s9�p8?���Z�?������M@hȄ·g@
=�Su��@]�0D��@�\��@�[�#e�@�܄z�@ 8�� ��@"��DM�@%����F@'�����R@*�'}=�@-q�Q���@0=bD�@1�:��p@3t��Gi;@5'�RR~	@6�FP��'@8��oYJ@:�$nV�@<��7#w@>O�\�j@@C�x*�@ANrTUe@B_����K@Cw�c��O@D�ς�c�@E�X�&��@F�yi#O@H
]uC@IM��,@J���@K�ex�@M؝��@Ndo Ƙ�@O��0��@P�N���@Q9zd#t@Q�~=y�W@R��p�@SX�oD�V@T
4~��@T�+ɳb�@U�� sh@VR-ZX��@W����3@W�NI�[@X�
�@@YtMB��@ZB�f���@[�I%ƹ@[�JG�c�@\����)4@]����@^oTq�U-@_K����f@`d-��!@`��,�o        ?��ء�6?ϕ�1�%�?�� ԗR?��!vĄ?���&�o?���X	�@zy'F�@
T��zc@kে0a@�2�5a@ᙟơ�@���:U@ E;fi,@"�!���~@%*~yGp#@'�P�0�@*�Ħ���@-�ѫ�{@0FC�'c@1ڸ4��@3~�|�@51���:@@6�uҨ�@8���h�@:��&jJ@<�>;K��@>����M�@@H׏��j@ASzm�%K@Bd��@C|>��4@D�+��jZ@E�TK���@F���s@H�\=Ot@IOKGP�b@J��4�@Ḱ�J�b@M;��H@Nb�B��1@O�����@P���v@Q5���Q@Q�Z���@R�:���@SR6�oE�@Tx�z�.@T�<�P�@U�z�#L�@VF+�7�'@W	G��@W��Y�R@X��6�@Y`�+�)@Z-ZϺn�@Z�)�@��@[�?܀�_@\����b�@]v,�X��@^M��R��@_'��ǿX@` �x@`q<����        ?�����v?�n'0'p�?꽦*^�?��&*�@k�],�@�V{���@k:�
�@Y}��@F硛<x@�X��~@#�F�4@&X���_@)���oy�@-�WU���@0��bV@2ΕvlG@4�-�j�@73��@9����^�@;�@>�K�@>rg��!B@@�˲$�:@Aت��dl@C7��Fr@D�_��@F��"}@G���x`�@I��v�@J�y~��@L9�g�gM@M�IkR-@O�\�@P��0�x@Qw�Mx@RXݿ 3F@S>A��@T'�mЉe@U0ءT@V����0@V��e��@@W�4��Vu@X�AE҅�@Y�m��#@Z��%�ʚ@[���洞@]�!ؙ�@^^��
�@_.q@`"�Œ��@`��	= @a>v���@a�����@ba)s�t�@b�~��@c��ޞ��@d!�N�L�@d�WCN�@eT�z�ݶ@e���SW@f��;��@g-�,�@g͑풔�@ho����        ?��� ���?țj��r{?ٶp���?�ڧ�+�?��ö�?�e��?����Q�@��*��@'}�f�@.A�89l@J�Ć�f@+���6@@9�*�@pTZ&�E@�_
�8@ ����jD@"��/�g@$j�c>��@&eܸ�yC@(rLQ�Q�@*��wc,�@,�k�>9@.��մ7\@0�x�CN@1Ԃm�s@39�/,�@4I~t���@5�/�I@6�0N!X>@80cl��@9��g^(@:��
�O@<Wa�hL@=�? �/@?=�F��M@@]|=�]�@AaɔB@A�>��@B�� �@Cx7N`��@DF�7�i@EN��0@E��]�g�@F�tQSI�@G��S=2s@H|c�:R@I\���A@J?�Q�@K%����'@L��w@L�%9Q�@M�7Y{$?@N�W�`@O̝a��@PacӼ<�@P��U��5@Q[yh hQ@Q�s�;.F@RZ�ʩR@R�2��@S^���@S��|��@Th���	        ?����0�,?�'q�
?�� ���?��P��?��蘟)?� Z�R[@�H`rl�@
����3@���0@A7M��@23��e�@q�XZ�C@ ~��o�M@"��B�M�@%yERz{�@(,0dh�@+ߧ���@-��P��&@0�h�WE�@2&g����@3Ӄ�y�@5�vI��@7\�1�l3@98֬���@;#����@=�ٶ�[@?%�MO?�@@�c�P�@A��l��i@B�f�Υ�@C��gݺ�@E\)PD@F@���@Gt��h�@H��2�8@I�ы��@K9�@�$�@L� ��z@M��"��@O7֓\j{@PLw�
�'@Q �,�-@Q���D@Rp?�8�@S,��w�@S�F�K�O@T������@Us긟�@V<�t`�@W�;f�@WԬ¬.�@X�,$��x@Yxk�]�g@ZNf�)-3@['|Ȟ�@\y�N��@\���&�@]�>���@^���B�@_��A�V�@`9��� $@`�,Ɠ_�@a&�R�j        ?�A�˘��?λ����?�2��|��?�║?�#���S�?�����t�@��t��b@	��'���@ Z�A��@|0~�S�@D���3@W�[��@�����e@"*^��@$��y���@'0�~%��@)�P���@,�o"�A"@/��n�El@1]��ǖ�@2��$�@4�#�ţ�@6M���t�@8�%�p�@9݌����@;���P$�@=�l��Er@?���S�@@��b>�@A�>��Ay@B�kj#��@C�U��s@Ea2�x�@F+�p�@GP2e=45@Hy�.��@I�<&��~@J��L`�P@L��y@MW3%꺠@N���~$q@O�P%(+K@P�����@QCܔ|��@Q�1�]�C@R���-�z@SP*&��'@T��\��@T��s�^	@Uq�#�ݒ@V,��S_@V�oZM�"@W��s$;�@Xi��l��@Y-�8�P=@Y�@U��@Z��N+^@[�аD`a@\R>
�!@] �1��@]�@�@^�oB���@_�exk	�        ?�(����?�O\8Y?�F��"�?�y�e` @���@r�L��@�����@��>�@����q�@2,�OY@"��`>@%�4���@)(Gz%A@,����Y@0A�`�[t@2;_��@4J�g��M@6o���Ln@8�w���@:�rqY��@=Y�0@?�ڬ<�@A*�5G�@Bws���@C�,u�@E+�!�h@F���9f&@H%F7;�@Iy��V��@J���Nm�@L�ʇ��@N��>�@O�eJ�*8@P�i��T@Qw��@RO0t�5�@S* ��z�@T�!7\�@T��GI�@U�pw��@V���*�I@W� ���@X��C�R @Y�g	�H@Z|+&@[y&YD@\vK���@]v��1�@^y'����@_`�QR"@`DSd��@`�xKW]@aR���0@a�6kx�R@be���y�@b��K�ׇ@c<&(�r@d�@d�T^v�-@e/�zEw�@e��|�S@fW:��d{@f��C�+        ?����d�?ǯ�|-7?��\��?�#�*��?���˖?�xta?��-�-�@���
@��"S�@�4{qC*@z�WV(@�����n@	��@F*Vb��@�?~
�@ ��a�@"yiQ�/@$fٽc`�@&f��k&@(x|�%�<@*�M�ͧ$@,��y�0�@/�Szb@0�3~�\@1�ݶ8�@3)
P��@4^/�@5�	.A@6�V�Aґ@8L�'S��@9�f��~@;@��#�@<y/z��@=꾲��@?b�?d�U@@p�	�@A3����@A��̺��@B�8kw�@C��ŹAz@D[|t�GB@E-={F@F|� ��@F��+�8R@G�֪.�d@H��;JR�@Io4���'@JQk�q.|@K6E�I��@L�b��@M���#�@M�C���@N�D��>�@OԵ���@PdG���@P�cZ��}@Q[��/��@Q�#��@RW���i�@R�b,�)@@SX1+�
@S�tKh@T]<�CP        ?��/�\��?���f|�q?�@�ojm�?��xI���?�) �ޭ?��*���@���y5@	�i���@��Z�@��0�_@WO�uS@q�Na�@ԇ�Z�@"?� `�]@$�v9�B�@'S8��u�@*e|jv�@,�G�U�I@/�4���@1��Z��@3 R[��3@4��t\4s@6�l��[�@8Rg|�@:*�l��@<ܢ�D�@>���&�@@*�[p�@A
�ɯL�@B{g�}�@C,�%�@DG�Vc�@Ehf���@F�lb"�@G�{5��4@H�|��a@J(Z�v_@Kf�쏈W@L�Trŵ@M�@��V�@OD�0r�@PL���p�@P��[�[0@Q�����@R[�Fƭ@S��@S�V5ȶ|@T�G_Sr�@U>���Y@U��p�n@V���T&�@W�J�i��@XH,�Hz@YW���@Y��$�@Z�hlJ�@[vA���V@\GH�@�u@]w,*��@]����r�@^�1*;@_��Oܹ,@`>ΗE�        ?�d��8�Y?�],���z?�D�t?��2�?��z�Qd?����E@Yf'�@{��<6@(e�I{�@�v4�@,c��@j+dj@!��lP@#�@ʄ��@&?�e�@)��V@,��[<�@/Ϯ�)@1)�5��@2�;�lh@4��RQgU@6g�8��@8H��Z�@:8�*��@<91/H&@>I�3z@@4-�|"M@AKh�#Q�@Bjφ��@C��N�@D�X�-g(@E�gF�@G-۔��@Hoh }�@I��!U�@K`�0�@L^�"a�@M��b�=�@OU��@PD��``@P�����@Q��,���@Rv�C��@S7c���#@S�����@T��5��@U��{G@VZ+ݮ�-@W*;o�-@W����@X�%{L@Y��ml�[@Z� �Z�@[c�7�J@\Dn�!3@]'�Q�%�@^���|~@^�+�*d@_�Z��#�@`g����@`߿��w�@aY4<>.@a����ڠ        ?�l���5"?�HJ���5?��P���?��HJ�.H@I?���@\��xX@D����@��Z��@�>�B��@��H�@"�]���@&���_@)w���i�@-׊�X7@0t�B��%@2t��Q�@4����a�@6�b��mf@8���V4�@;G��p�o@=���Js@@�N�"{@AZ��d>�@B�i�$!p@D��@�x@Ecz����@F̾�1xv@H>EÛ!I@I��x�@K9z$��@L�ڎfk�@NS��@O살�v%@P�G���'@Q�����[@Rq>����@SLv�e@T*a79�G@U!�6@U�F��t�@V���y�@Wń�[�@X���tbV@Y���Aϕ@Z��5��@[�<!�R9@\��E�xS@]����@^�$tv@_�C��*@`M�r�;@`��W�)@aX9lV6c@a��	��@bh�Q}(@b�	�MA$@c~��/P@dw���@d���:��@e(��9�@e������@fKv1��(@fވ �ck        ?�����v?��5F���?��5�b?�/��G�=?���2 �?�����?�\��)k�@1�[�@��7�BT@����^@�"@��@�FW���@,Ȟ�@rԼ��U@�}�(��@!W���@#EH��U@%F.��U@'Y�]�jy@)g� �@+�����@-�yD��@0,w�Z@1agB��@2�W�}B�@3� + �@5/t�)��@6�G߶�@7�i��Xi@9@�6�Nv@:��|��@<9�j��@=�(:�D/@?�88r@@IVC��I@A޹��@A�����@B�T�d�@Cp[I�+@DA�n3��@E���<�@E슇�KX@F�6�#��@G��U��A@H��2�@Ic�@�.�@JGോ�@K.�)�ԇ@LFhg�@M;Yc�H@M��`�@N��C�@O���I�@Pf1=��@P�,	@@Q_L��LD@Q݌E���@R\�Ǹ�@R�PV�-�@S^����@S�L�p�@Td�׆��@T�]����        ?�;���?Ў����?�W��ه?����s�??�����?���E�n0@LCH�]4@d��a��@K^�k�@�%��@�D��l�@?E�
ڈ@ ����:]@#s�4�z@&��B
�@(��h �C@+�[$�1�@.���i@1p"$�@2��i
Δ@4g���@62�JqW@8Z�S@9�Si��@;���0�@=�c�@@�$��C@A*�-x"@B5�_�%�@CW/r(q6@Dҡ4�M@E�i���v@F�ܥ�1@@H#h퀑@If�.@4�@J�\�1�@LB�>�@MY�b�J`@N���"@Px�ђ'@P�vo1��@Qz���-@R5�='�@R�rz@S���D�@Txn�MK@U?.l�S0@VƝ:�@V�.�Lc�@W�_3rn�@XvN��P�@YJ����@Z"EmY�1@Z�:�"��@[��M�@\��ɛ|�@]���	J�@^}՚Jn�@_d����@`&��KE�@`��op�o@a�$Q@�@a��H{�        ?��^��?��ghTR?���!��?��x���?��MȀ*?���_�A@����X=@
����@�@�nd@,���.@cx��@LY���@ f���'@"��[iˌ@%P�g�@'���Nm�@*�_fd��@-����@0ZZ�;\�@1�}��@3���V�@5A����@7 �D���@8�}n�.@:����S�@<����@>�Z�� @@CfH0]@AJQRX�@BWN\?@Cj>+��@D�<,�D@E�|�SB@FŒ9�@G�([	�5@I&_޷@JRs�)�@K��qGΧ@Lʙ$���@ND=��@OV��O�a@PR,W���@P�K]��@Q��/���@RT��h`@S��\��@S���Bn&@Tk_��G.@U"
;@U���˳0@V��D�J�@WR��o��@X��AY�@X������@Y��f��i@ZZ��
��@[!��3l=@[�����@\�-��Q�@]���>5@^P
n��G@_ ,��Y@_�a"�w        ?�4��F?ںLO��?�Vƛ��?�����8@>�G ��@	�ƣ/@(��^@�o�QA@bA���@ �	����@#���:�@'.��ݮ@*ȥVO.\@.��BB4@1K@o/�@3c)r�n@5�3����@7ח�4�@:2��SN@<���4�@?'"J�@@߶�c��@B5�E*��@C�����_@D�)��d@Fn����i@G蓛���@Ik)ښ��@J���Y�@L�ōb�@N$Y��'@O��*rv@P��E�D�@Q�m��A@Rm����@SN���@T1��N�@UƖ��1@V=�f@V����@W��R�|@X�S%ZK�@Yͻ�ԓ@Z�A�6aX@[���3!e@\Ƃ.f��@]�&P�?�@^о�m��@_�A\~,C@`sR(��@`��P�M@a��Y��@bY=�k@b�lUHo@c'3ᴴo@c���t��@dEO>��@d�E&�pE@ehwi��[@e�ߝ�>�@f�w��H@g&9_��@g� >ތy        ?�w8�=M�?ȁ�L��?ٱ�#:?��Ә�=@?�y�C?�EG%�P�?���p��w@��$�J5@��7�@���H�d@�0&w��@��q��@�s��s5@�� �.@|�����@!�@ܡ�@"��Q��@$�"�-A�@&�ȡ/hR@) 0|t�@+R�N�¾@-��d5�@/��sg�@1*�濦�@2f�j�'\@3�a6�{�@4�.�@�@6M!��	�@7�$��@9 .�f�@:{����x@;�rx~@=m7I:Q@>�	c���@@>E	�i@A��
�@A��J]�@B���u'�@CyŞ�U�@DQ��L�@E,��*��@FP"�1@F�D�;��@G҈�Rj8@H�#LH�@I��b0(i@J���0d@K��$��@L|�e�y@Mu*� �B@Npo�a[z@On�/,�@P7�7GX>@P��rt@Q=�˔��@Q´�pI�@RI-�0�y@R��3]�@SZm�Zހ@S�.�/;�@TqVvUw�@T��+Ѝ@U���V7^        ?��t���?�a0C�e?�+8���?�^C�w$k?�ZFٰ��?��v��@Xڌ�R@(��2f@�9@��Rp�@�\tpc�@	Ԍ5h@ �?{b@#S����l@%��V��@(�����@+�N��@.��8�]�@0�O�3�@2���@4MXq�O�@6��@7��;գ@9�߯4x@;�g�@=�:�\n@?�:�:�M@A��{|�@B�aA�U@C>�$%��@De�s%^d@E����G@F�|��@H߀#S@IE�fZ�@J�f��c@K�^��E�@M2�IT@N�O`$9*@O� L<eL@P�	�'��@Qc
5�1@RUpRZ@R���zX-@S�����@T\�f�"@U">Z��@U�v�FX�@V��i�i�@W���ϐ@XT�X]a@Y'_C��@Y�F���@Z���;�@[��U��@\����ݥ@]n�p�|�@^QR���@_6seM;@`Í�@`� s���@`�/��A@aq�"�%        ?��$��O?ϡJ@�͏?୐���?�g!(_?��xʷ��?���)H~@����07@
|���f@�$.S��@%���t@�^)��@Q&~�Ǣ@ mkQ�?8@"ׁ ��@%e��E@(��Ғ@*�7Lf�g@-��"@0}�S8x@2%���@3�%Ba@5�ƅ�g@7K�u�}@9%í��@;���T@=�y���@?Y��;�@@�nɝ@A��^�@B�u�8\@CՄW��@D�!�B#�@F%5`?c�@GV��'�7@H�f�)�o@I�Y.l�@KhίB�@LZ�8�@M���>��@O u�!��@P.6AL�@P�ун�@Q�`
@RH�����@S�=	)@S�����@T|1��ٝ@U=c ��@V5��� @Vǡ{I{@W�����@X\#��p;@Y*,�e|@Y�����@Zͪ�@i�@[�D���@\z��Ɇ@]U6mH@^1�ke.�@_�ol�@_��U�@`j�}�u	@`�b�߽        ?�R�O�?��
���?�K��B��?�^�t�|5@�G�H�@	2�o%�@Ɲ�9@����m�@��Hx��@ WU	E�@#}��| @&���%b@*{N{�$�@.M�Eg�@1*�l�?@3H���@5�p�L�@7���E�@:5���%�@<�o>��@?H�l`o�@@����E�@BZ6��wd@C� A"��@E:sc��U@F� *%�@@HC��n�@I��0@KtL�9(�@M��,@N�V2��G@PBp�$�@Q#�;['�@R	����[@R�=>`%@S���#�@T��! j,@U�[u��u@V�b���@W��D�e@X���y�@Y����-@Z�.ś@[�`:��@]��k@^��LL@_9�Yb�x@`,�UsI{@`�k�x��@aR����@a��4�@b~�^C��@c�e\��@c��:�։@dOw�i��@d��}�'@e����,@f/�;L@f�3��I�@gxW�R�[@h#hǿ�@hǓ ڬj@iq�>y��        ?�aL�=?�v�~p/�?٧��u�?����F�?�$��p?�D�[�	�?��;T�M@�n:[
@��Y��@�4�f1@�zi1@����؛@��fףR@2�ҭ�P@�\�H�@!3�W�2@#ϧn�@%p�0ʈ@'28��ؔ@)W���R|@+�c���@-�����@0���EJ@1P�v/@2��6r @3�Zlg�X@5$J.Ͻ~@6{EF��@7�1u&n�@9@����@:�n��@<%�M�6�@=�/@?(�2��@@Z%�A�@A#�.�^�@A�A%��`@B�&
�!@C��+�i@Dnd����@EI��bd�@F(I�{�6@G
An�@G�0��@H�
~=��@I��7�@J�ş��6@K���k[@L�;�0�@M��Ϋ��@N�0�$�@O��"�n�@PG9���h@Pɒ)��l@QMl@�@Q��P2=�@RY��2ub@R�����@Sk��{�T@S�ꄱ_�@T�����+@U�W|�@U�W���        ?�M���~]?д�ڛ��?ᅲg��?��CZV�?���4�@ �
���@����@�~F�Q@I�����@�4h��@*��si|@�0�O@!)��i�@#���X@&YC���@)(اpUk@,~ۉ�$@/3g�ϖ�@16hCn@2�w�9�@4�*��+@6p���7
@8N��p@:=��jX@<:~�a��@>G$j	t@@1F�f3@AFT���@Bb�o!�F@C��A^ @D�bΪZ�@E��£e@G��JA@HX�*�@I�n^!�e@J�E! �@L=HS���@M�\T�Z�@N��ILH1@P-�J��%@P���b\@Q��/���@RXp9��@SP���@S�ob@T��7���@UePb�7q@V/��J_@V�̻�`�@W̱UL�@X�O�t�@Yt�bc�\@ZL���w@['<D���@\ve���@\�F
�z3@]ƥ��z@^��)_ߖ@_�>�@`>y�C�@`����-p@a,$ly<@a��h�(        ?����CkU?��=�Pz?�%��D�?�+���?�;��FǾ?�ff�h�@��B�@C��_#@�1Ĝ��@���͉@�$rV�@�.���@ �]$DR�@#@n���@%��5���@(�$s��@+�5+f9@.�P7e�i@0ݍӛ�@2�jlݞ@4;��=j@6�@�!�@7��&�z5@9ã8�2@;��U�E@=���5@?�J��C@@�摸Xp@Bv;)�j@C89�T�r@D`�|Q�@E���0�j@F��g:XP@Hm,�U@ID�p2�@J��gS�@K߶
�S,@M7 ��� @N�����@O����su@P��	��S@Qj*�Iu@R%~�#@R��ޑ@@S��Y�<�@TjWbI�@U1{�K��@U�߹�~�@V�)Dh�@W�P!=��@XlL#�\@YB+Q�f@Z���j@Z��Ǹ�^@[��a#E@\��ݶ�@]�5Lv@^~M��a@_g	k�@`)0څ�@`�((< #@ag� �@a���17U        ?���F<�?����"�?�K�8"�X?�7�Z��!@lD�^c@	����Y@W�)�'@Cz�gx�@��P�m4@ ����'@$�
��T@'���N@�@+0|���;@/C�1U@1�q�dl@3����[p@5���K�F@8J��K6@:�U���@=8 ���@?�|��@A>+[�lG@B�z�ii@D
<���@E��R!@F���a�@H��c��l@JvrD,_@K�����@M\cFX@OYg�-�@Pa�H�C�@QBT���s@R'dFj9U@S݂���@S��3U��@T��|��@U�%c��:@V�ʙ�@W�L��/�@X��#-��@Y�X��@Z�_��@\��F�@]k���@^+�X�!@_E�+�r@`1�m��Z@`¡)M&@aUDb��y@a�T��6@b�̂c�@c����@c� �fڳ@dM�(��@d��-@e�MV�m@f+={�Z�@f��(��@grM��B�@hg����@h�4���a@ii�'��        ?�~p	,Hi?�֒Et��?���[��?�l�^�_?���L�L?��sMw~?����0�@�V�s��@����"@�٠�@�S^�b�@l��XF@l XD�@�L���D@�W����@ 4�B��@"	X�B�@#�-���(@%��e�@'�S��"@*z���@,4ו�Z@.r�Ty@@0_���@1���Լ@2��y���@4x��]@5J�&��@6���k@7��)7D�@9Ja����@:���2l�@<�ҟ�	@=���;u@?Z��.�@@@��ή�@Ato�&5@A�~z��@B��>�4�@C_*$��@D.�����@E_�r��@E��dZ@F��e��I@G����Ӷ@Hj<!�Х@IK؛N�m@J0X���Q@K�V�8�@Lⴁ,<@L��ᶼ�@MޗQң<@N�׵X@O�934��@P_	�� �@P�K�s�&@QZ��@Q��gp��@R[���N@R�x�i�@SbCe�9)@S�X KY�@Tm�p���        ?�J���ha?Х��]U?�t���~?���{�.X?����٧@ ��ȿ�@-�`�@�Lf�t�@F��@��=�@.J����@�6操�@!1�0f�<@#��
.t+@&jlB"b�@)?�6@,:z��
@/YJ�p�@1MנN�@3 5P@4�J�
N@6��g0'<@8~��@:s�o���@<y�]>�@>�4I��@@Yk!IP+@AsSt�z�@B�����`@C�e��jN@D�Q@�k�@F$VJ���@GbW�=�@H�;�_~@I��Fd��@KEP��ߧ@L�W���@M��`u�@Oc�:1~X@Ph4H@@Q!�
w�g@Q��` |@R��Y�0@S`.5?�@T%�p�1�@T�D|{�H@U��yÔo@V�@yc�@WY4g|B@X-3��oM@Y���(�@Y݌�z@Z��s��5@[����@\z�:ޱ@]^��Ъ'@^E�a��@_/��u�@`�'�I@`�S���@`�=Z�Z@aw����@a�=� �         ?�>�Fl|'?��J!�y?�=Q���d?��F�D��?�5��M�<?�����Y@/'�2z@	�\�NMQ@td��O@��^�@d��7I#@�!j�@��r�i@"Gի�%Y@$����Ӷ@'[#]�@*감z\@,�ZL�5@/��ך��@1����5+@3!��H�~@4�V+q>@6�/!�b@8O�~�G�@:&*tIǵ@<
�>��@=��=��@?��÷K@A'i��h@Bԥ��A@C#׫:n1@D={@E\o��A�@F����s(@G��`�:@H�8�#5@J]xi@KQ�� U@L��O��@M�%ǋ�?@O(���p@P=1zl�@P��g��@Q�ZF9Q/@RHL��@R��7w��@S����@Tj>��4@U%'
�F@U�w�v��@V�)e@Wd2v�2�@X(��A��@X�,ǥ��@Y����D@Z�&���1@[Pq�4�@\��q�@\���@]�@|��@^���@_r�&���@`&u�"�        ?����?�{ؓ	u?�W�0U�?����/`%@)0$�1@36�«*@,8)�@��IH��@�`��0@u�g(�@"�t�:@%�f}�P@)qi[%nK@-o��l@0x���@2}	�z�@4�����@6��R]��@9���@;p��(��@=��h["�@@4�4.�<@A��+���@B��å�C@D9N[���@E����@G�!`@H��ο�@J��-j�@K�6�LU@M:4�D��@NؗmX�-@P?�+]:g@Q`+M�@Q�k�"�@R��vP,�@S��M�-@T�"��1@U�!�A,@Vu� �U�@Wg�����@X]�ٺ@YW��qM@ZT�Xc�@[UKv��@\Yd��Oe@]`��
�@^k�$>c�@_z-�#�@`Eɸ�� @`�-50@a\+���@a���lm]@bx�Q��@c	�A�� @c��PJ\&@d/�?^\�@d���.�@e[�Y}1�@e����@f�شh��@g)z�KY@g��wDp#        ?��i卧?Ȯ����?��'���?��Z��?�ON�n�?�{*w�=?�>�Tw�@����v@ȿ R�*@��c�@�<���@�eQ[/�@�RPk�@X��ӣ{@������@!C^���@#+�]�4/@%&��&2G@'3��nh@)RQ��@+���7@-�rh��j@0ݎ� �@17B�0p�@2n9���w@3���iP@4�+Th� @6>�_�@7�aV�@8�Ja��@:M�:b�3@;�QhqI@="�~�Z@>���"�'@@��x�%@@Ƞ��@A���7�K@BQ��9�@Cwǁ�@C��+�r@D���c4�@E��B]��@FY�����@G0+�4M�@H	P9��O@H�؄o@I�D��2b@J���Ձ@K�?��*=@Ll��x�@MU���@N?�Οu�@O,mI�`@PӜ���@P���~B@Q |�	�@Q{}��R@Q��mg:@Rt�{ `@R��ó��@Sr9<-I@S�}� |@TsĀW�        ?������?�t����?�A�=:Tl?���z��?�xs�?��-���@6AV��@H�/1�,@>�	K�@��nP�@�7��@#0���@ �4X~4@#a�5<@&</�@(��5��@+��ɖZ@.���&@0�5�$�y@2��Q�S@4R�o>aJ@6��f�@7��	�E�@9ڤR �@;��`Ǡ*@=�M�>ة@?��8"�@A�|��@B"\���Z@CB�r4�v@Dj��ra�@E�S1��1@F����5�@H]�.��@IN���v�@J�u�T�l@K���_�,@M@����@N���d96@P �% 7i@P���{=@QnL˨�@R)��H�q@R�2t�r�@S��l�w@TnI��d@U5�\]rf@V Z��ͳ@V����.�@W�+����@Xqh��.�@YG~�z��@Z d�l	�@Z���[@[ڇ��3*@\���X@]���1��@^�8��8C@_o|�y(@`-����@`��L9�@a�o�$g@a�Y�.��        ?���|�x?��M�!�?���:��P?���*0k?� ��C?�R�z��@��.RD�@
��7$�_@�Q��K�@M,p�ȝ@??���`@�C�R@ ��w�T@"�Q�D��@%}3g!�<@(-��4�@+ f]k�@-��80@0�">tS�@2�_q�@3Ǔ7$k@5�Su��@7H�2A@9t�Q��@;P\�@<�ag�d@>�qF%1Q@@�#��e�@A�U���@B�4��Ϙ@C��{4@�@D㐍H��@F�&��h@G:h3j&�@Ho%��k@I��3JK�@J��F}�`@L1�'ӑ�@M~ $<p�@N�o���@P3���Y@P��Ѧ�6@Qt*�U)@R(��Q�@Rߜ���@S�E	 `@TU7?O's@U��E��@U� �� @V��5�.�@W^����@X'$˷�@X���o�@Y�,�@��@Z����@[`|�.@\4�O�Y@]
ܞ�$X@]�eSS��@^� �Y+�@_�	.�Qq@`=�x%@`��&^b_        ?��A6��?��I3g�?�*���U�?��i��,@O�dm�@	ɼ:y@5))���@��kI@pt�@�r@ �;��(�@#�ďr}@'/�R�0@*��o�<@.�����*@1B%�c.�@3U � '6@5}�յ�.@7�5uצ@:�#�`@<uMX@>��_���@@�`�o\�@B�RM�@Cf��3�@DǶ��@F1d�Y��@G�W��5@I_��@J�O�I @L)Z]�g@M�P�&(�@OS3^��@Py�!c@QMI[��@R$��:� @R�1���@S�M��rT@T���R<�@U����Q�@V��O@Wv�ļ��@Xe^.1�=@YV�w#q�@ZK�����@[CWr|=@\>����@];��E�O@^<Gw��@_?�����@`"�����@`���p�@a-s��]@a������@b=]���'@b�Qlt@@cR�X��z@c�^,�V@dl�E'@d�����@e�)�ޜ@f�����@f�?�\H�@gD<]        ?�R����?ǈ,����?ج	e韤?��^wM?���_�?�k��C�K?���i?Kc@�P��@�.l`��@�_[��@H"c�@�9����@���6@>d�~��@��	&�@ ����@"l�)��@$U9�]|�@&O�m
P�@([I
�Z-@*w/���@,�ˀ���@.��}{@0���D�@1�����@2�7�A�@4.�J�@5pf���8@6��Cr�k@8dЦQ$@9\����@:���3�@<��3�@=�M_�0@>�яR�@@1��_�@@�I���@A������@Bn�9+�*@C3*��o�@C�Kc���@D���}L�@E�%�?*@F^�6�0�@G/�V��@HZʙU�@H�/�aB�@I�W>�6@J�ǐe�@Khw�+�}@LG^SP�+@M(r9#@N�U#,�@N��u>�=@O�\;g�@P`���o�@P֗���@QMHޤ>�@Q��GR�@R=��a�@R���3�@S1��@��@S���y2�        ?��}z@�?�Y��
��?�$��t�1?�Tnø	?�R�^�?�����D�@z���Y@:�v�Z@�9$;,@���C>@�W9�@�����@ �Фih@#=���0�@%י��@(�`3�9@+v��;@.y[|^@0κΣ��@2qdٱ@4$0�Qfj@5�ѫ)�@7������@9�i�F�e@;��I���@=��Ba��@?��@@@@ٯ~g��@Aq�@C
\��w�@D,�6M?F@EVC�W�@F��WSxW@G����@H���|@J;��&�,@K��Z,�{@L��Tv�@N)A��K@O�>�q�@Pr�琲�@Q&/�tV@QܑW���@R��Ȧ)@SQݥ_�~@T�=��@T�H�A�@U��&�I�@V]�0��@W'S��@W�H��A @X��wt@Y�Fua�[@ZgǊ:�@[=7)��@\�4�zM@\���D@]�3�-�@^��.Y��@_�����z@`:����@`�H	�B@a!��{��        ?�'u�@,?�5�h��?�vG�G�?�[�d��?�_��S�?���[��@%���ʾ@5���`@��x�u�@�*�� �@��j�@j!�@ �<�Q��@#RrO��@%�[d�B@(�*�__@+��� @.��p:@0��p	!@2��uj\%@48�
��@5��=�@7���(u@9����(@;���P) @=��n���@?��(�^(@@�e�<�@B �b�x@Cȍ�@DA�.N�b@El��GV@F�u-&O�@Gֵ�B@I{�E�C@JZ�� �l@K�;��T@L��/̫@NP��@O�0)]L@P�/��dV@Q>Ets�<@Q�PU�w@R�G!]�b@So �4@@T/��m��@T�Z���@U��V��@V��ٮD�@WN�CׁQ@X1���@X�-�~�@Y��>-��@Z�_�i@[q[�I�<@\L��1"@]*�8q�Z@^�U�@^�1�V@_��s�@`^���H@`�(+^`m@aI}O��        ?�끰\?���(�?�W.�	?�1���[J@���8�3@�8�)<�@� ����@=�t@iRh�k=@ Cb:�@#Ժ�A@&N�A�@)��V�Re@-bLdL��@0���n�@2���+?@4��\X(^@6�6��Z@9�Q�@;Y�
��@=�g��z$@@]hF�@AX<���{@B������@C�3�VA@EO��l�@F�n;�d�@H�"�@I�rwa<�@K��/�@L��Q۹�@NJ�A|�@O��Au�@P�LD���@Qg

�@R8At�@SB$�l�@S�v��N�@T������@U����49@Vz�f��X@W]�I|��@XCo�(C@Y+ަ��=@Z����@[��ZV�@[�>��q�@\�AQ�*�@]��HI�U@^�ۚ̋@_�_�R�"@`f��;�u@`�OUGzN@ag�xy@a��@bl#w+��@b�L���0@cu�fT�{@c���TO@d�.}g@e�R#�@e��)*H@fX�yR0